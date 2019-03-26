library(SmarterPoland)


### Name: cities_lon_lat
### Title: Geocoordinates of Largest Cities
### Aliases: cities_lon_lat
### Keywords: datasets

### ** Examples

## Not run: 
##D 	library(maps)
##D 	data(world.cities)
##D 	cities_lon_lat <- world.cities[!duplicated(world.cities$name),]
##D 	rownames(cities_lon_lat) = cities_lon_lat[,1]
##D 	cities_lon_lat <- cities_lon_lat[cities_lon_lat$pop > 50000,]
##D 	cities_lon_lat <- cities_lon_lat[,4:5]
## End(Not run)



