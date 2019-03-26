library(rpostgisLT)


### Name: roe_gps_data
### Title: Example data from a GPS tracking project
### Aliases: roe_gps_data roe_sensors_animals_tables roe_vector_geom
###   roe_raster
### Keywords: datasets

### ** Examples

data("roe_gps_data")
head(roe_gps_data$GSM01438)
data("roe_sensors_animals_tables")
roe_sensors_animals_tables$animals
data("roe_vector_geom")
if (require(sp, quietly = TRUE)) {
    plot(roe_vector_geom$adm_boundaries)
    plot(roe_vector_geom$roads, col = 'red', add = TRUE)
}
if (require(raster, quietly = TRUE)) {
 data("roe_raster")
 plot(roe_raster$srtm_dem)
 }



