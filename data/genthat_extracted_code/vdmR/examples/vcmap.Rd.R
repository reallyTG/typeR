library(vdmR)


### Name: vcmap
### Title: Generate choropleth map with interactive functions
### Aliases: vcmap

### ** Examples

data(vsfuk2012)
shp.path <- file.path(system.file(package="vdmR"), "etc/shapes/kitakyu2012.shp")
kk2012 <- dplyr::filter(vsfuk2012, CityCode<40110&CityCode>40100)
vcmap(shp.path, kk2012, "CityCode", "CityCode", "map1", "kk2012")
vlaunch(kk2012, "main", "kk2012", browse=FALSE)




