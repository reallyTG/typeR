library(wellknown)


### Name: wktview
### Title: Visualize geojson from a character string or list
### Aliases: wktview

### ** Examples

## Not run: 
##D # point
##D str <- "POINT (-116.4000000000000057 45.2000000000000028)"
##D wktview(str)
##D 
##D # multipoint
##D df <- us_cities[1:5,c('long','lat')]
##D str <- multipoint(df)
##D wktview(str, center = c(-100,40))
##D wktview(str, center = c(-100,40), zoom = 3)
##D 
##D # linestring
##D wktview(linestring(c(100.000, 0.000), c(101.000, 1.000), fmt=2),
##D   center = c(100, 0))
##D 
##D # polygon
##D a <- polygon(list(c(100.001, 0.001), c(101.12345, 0.001), c(101.001, 1.001),
##D   c(100.001, 0.001)))
##D wktview(a, center = c(100, 0))
##D wktview(a, center = c(100.5, 0), zoom=9)
## End(Not run)



