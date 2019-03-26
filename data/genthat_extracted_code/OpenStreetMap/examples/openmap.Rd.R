library(OpenStreetMap)


### Name: openmap
### Title: Get a map based on lat long coordinates
### Aliases: openmap

### ** Examples

## Not run: 
##D #show some of the maps available
##D nm <- c("osm", "maptoolkit-topo", "bing", "stamen-toner", 
##D 		"stamen-watercolor", "esri", "esri-topo", 
##D 		"nps", "apple-iphoto", "skobbler")
##D par(mfrow=c(3,4))
##D #Korea
##D for(i in 1:length(nm)){
##D 	map <- openmap(c(43.46886761482925,119.94873046875),
##D 			c(33.22949814144951,133.9892578125),
##D 		minNumTiles=3,type=nm[i])
##D plot(map)
##D }
##D # Some maps from custom urls
##D apiKey <- paste0("?access_token=",
##D  "pk.eyJ1IjoidGhlZmVsbCIsImEiOiJjaXN1anNwODEwMWlrMnRvZHBhamRrZjlqIn0.Gf8qLSpZ6yo5yfQhEutFfQ")
##D baseUrl <- "https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}"
##D map <- openmap(c(43.46886761482925,119.94873046875),
##D 	c(33.22949814144951,133.9892578125),
##D 		minNumTiles=4,
##D 		type=paste0(baseUrl,apiKey))
##D plot(map)
##D 
##D baseUrl <- "https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}"
##D map <- openmap(c(43.46886761482925,119.94873046875),
##D 	c(33.22949814144951,133.9892578125),
##D 		minNumTiles=4,
##D 		type=paste0(baseUrl,apiKey))
##D plot(map)
##D 
##D 
##D #plot Korea with ggplot2.
##D library(ggplot2)
##D map <- openmap(c(43.46886761482925,119.94873046875),
##D 	c(33.22949814144951,133.9892578125),
##D 	minNumTiles=4)
##D autoplot(map)
##D 
## End(Not run)



