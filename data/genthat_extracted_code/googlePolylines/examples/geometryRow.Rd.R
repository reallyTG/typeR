library(googlePolylines)


### Name: geometryRow
### Title: Geometry Row
### Aliases: geometryRow

### ** Examples

## Not run: 
##D 
##D df <- data.frame(myId = c(1,1,1,1,1,1,1,1,2,2,2,2),
##D 	lineId = c(1,1,1,1,2,2,2,2,1,1,1,2),
##D 	lon = c(-80.190,-66.118,-64.757,-80.190,-70.579,-67.514,-66.668,-70.579,-70,-49,-51,-70),
##D 	lat = c(26.774, 18.466, 32.321, 26.774, 28.745, 29.570, 27.339, 28.745, 22, 23, 22, 22))
##D 
##D p1 <- as.matrix(df[1:4, c("lon", "lat")])
##D p2 <- as.matrix(df[5:8, c("lon", "lat")])
##D p3 <- as.matrix(df[9:12, c("lon", "lat")])
##D 
##D point <- sf::st_sfc(sf::st_point(x = c(df[1,"lon"], df[1,"lat"])))
##D multipoint <- sf::st_sfc(sf::st_multipoint(x = as.matrix(df[1:2, c("lon", "lat")])))
##D polygon <- sf::st_sfc(sf::st_polygon(x = list(p1, p2)))
##D linestring <- sf::st_sfc(sf::st_linestring(p3))
##D multilinestring <- sf::st_sfc(sf::st_multilinestring(list(p1, p2)))
##D multipolygon <- sf::st_sfc(sf::st_multipolygon(x = list(list(p1, p2), list(p3))))
##D 
##D sf <- rbind(
##D 	st_sf(geo = polygon),
##D 	st_sf(geo = multilinestring),
##D 	st_sf(geo = linestring),
##D 	st_sf(geo = point)
##D 	)
##D 
##D encode(sf)
##D 
##D enc <- encode(sf)
##D geometryRow(enc, "POINT")
##D geometryRow(enc, "LINESTRING")
##D geometryRow(enc, "POLYGON")
##D 
## End(Not run)




