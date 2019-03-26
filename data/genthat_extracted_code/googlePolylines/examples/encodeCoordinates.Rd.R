library(googlePolylines)


### Name: encodeCoordinates
### Title: Encode coordinates
### Aliases: encodeCoordinates

### ** Examples

## Not run: 
##D 
##D ## Grouping by polygons and lines
##D df <- data.frame(polygonId = c(1,1,1,1,1,1,1,1,2,2,2,2),
##D   lineId = c(1,1,1,1,2,2,2,2,1,1,1,1),
##D   lon = c(-80.190, -66.118, -64.757, -80.190,  -70.579, -67.514, -66.668, -70.579, 
##D   -70, -49, -51, -70),
##D   lat = c(26.774, 18.466, 32.321, 26.774, 28.745, 29.570, 27.339, 28.745, 
##D   22, 23, 22, 22))
##D 
##D 
##D ## using dplyr groups   
##D 
##D library(dplyr)
##D df %>%
##D   group_by(polygonId, lineId) %>% 
##D   summarise(polyline = encodeCoordinates(lon, lat))
##D   
##D ## using data.table
##D library(data.table)
##D setDT(df)
##D df[, encodeCoordinates(lon = lon, lat = lat), by = .(polygonId, lineId)]
##D 
##D 
## End(Not run)




