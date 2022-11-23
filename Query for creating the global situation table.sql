DROP VIEW IF EXISTS global_situation; 

CREATE VIEW global_situation AS (

SELECT 
	MAX(forest_area_sqkm) AS first_recorded_f_area,
    MIN(forest_area_sqkm) AS last_recorded_f_area,
    (MAX(forest_area_sqkm) - MIN(forest_area_sqkm)) AS forest_area_loss_sqkm,
    round((((MAX(forest_area_sqkm) - MIN(forest_area_sqkm))/MAX(forest_area_sqkm))*100)::numeric,2) AS percent_loss
FROM forest_area
WHERE country_name = 'World'
);