library(brazilmaps)


### Name: join_data
### Title: Join external data
### Aliases: join_data
### Keywords: IBGE geographic levels shapefile spatial

### ** Examples

# Joining population estimates data to the year of 2017
data("pop2017")
municipios <- get_brmap(geo = "City", geo.filter = list(Region = 5),
                        class = "SpatialPolygonsDataFrame")

municipios <- join_data(municipios, pop2017, by = c("City" = "mun"))




