{{ config(materialized='view', tags=['gold']) }}

SELECT
    REGION,
    COUNT(DISTINCT WAREHOUSE_NAME) AS warehouse_count
FROM {{ ref('dim_warehouse') }}
GROUP BY REGION
ORDER BY warehouse_count DESC
