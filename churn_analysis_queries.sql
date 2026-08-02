-- 1. Calculating RFM Recency & Churn Status using CASE WHEN
SELECT 
    `Customer ID`,
    MAX(`Order Date`) AS Last_Order_Date,
    DATEDIFF(DAY, MAX(`Order Date`), '2024-12-31') AS Recency_Days,
    CASE 
        WHEN DATEDIFF(DAY, MAX(`Order Date`), '2024-12-31') > 180 THEN 'Churn Risk'
        ELSE 'Active Customer'
    END AS Retention_Status
FROM Superstore
GROUP BY `Customer ID`;

-- 2. Average Shipping Delay Analysis using Window / Aggregate Functions
SELECT 
    `Ship Mode`,
    COUNT(`Order ID`) AS Total_Orders,
    AVG(DATEDIFF(DAY, `Order Date`, `Ship Date`)) AS Avg_Shipping_Delay_Days
FROM Superstore
GROUP BY `Ship Mode`
ORDER BY Avg_Shipping_Delay_Days DESC;