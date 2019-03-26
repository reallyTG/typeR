library(mapmisc)


### Name: geocode
### Title: Georeferencing with Google
### Aliases: geocode

### ** Examples



## Not run: 
##D 
##D if (requireNamespace("dismo", quietly = TRUE)) { 
##D 
##D cities=geocode('Ulan batar')
##D mytiles = openmap(cities, buffer=800*1000)
##D 
##D map.new(mytiles)
##D plot(mytiles, add=TRUE)
##D points(cities, col='red')
##D text(cities, labels=cities$originalPlace, col='red',pos=4)
##D 
##D }
## End(Not run)





