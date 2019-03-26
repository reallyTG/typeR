library(lawn)


### Name: view
### Title: Visualize geojson
### Aliases: view view_

### ** Examples

## Not run: 
##D # from character string
##D view(lawn_data$polygons_average)
##D view(lawn_data$filter_features)
##D view(lawn_data$polygons_within)
##D view(lawn_data$polygons_count)
##D 
##D # from json (a jsonlite class)
##D library(jsonlite)
##D x <- minify(lawn_data$points_count)
##D class(x)
##D view(x)
##D 
##D # from a list (a single object)
##D library("jsonlite")
##D x <- fromJSON(lawn_data$polygons_average, FALSE)
##D view(x)
##D 
##D # From a list of many objects
##D x <- list(
##D  lawn_point(c(-75.343, 39.984), properties = list(name = 'Location A')),
##D  lawn_point(c(-75.833, 39.284), properties = list(name = 'Location B')),
##D  lawn_point(c(-75.534, 39.123), properties = list(name = 'Location C'))
##D )
##D view(x)
##D 
##D # Use view_ to pass in arbitrary objects that will be combined
##D view_(
##D  lawn_point(c(-75.343, 39.984), properties = list(name = 'Location A')),
##D  lawn_point(c(-75.833, 39.284), properties = list(name = 'Location B')),
##D  lawn_point(c(-75.534, 39.123), properties = list(name = 'Location C'))
##D )
##D 
##D ## another eg, smile :)
##D l1 <- list(
##D    c(-69.9609375, 35.460669951495305),
##D    c(-78.75, 39.095962936305504),
##D    c(-87.1875, 39.36827914916011),
##D    c(-92.46093749999999, 36.03133177633189)
##D )
##D l2 <- list(
##D    c(-46.0546875, 8.7547947),
##D    c(-33.0468750, -0.7031074),
##D    c(-14.0625000, 0.0000000),
##D    c(-0.3515625,  9.4490618)
##D )
##D l3 <- list(
##D    c(-1.40625, 38.81152),
##D    c(14.76562, 45.33670),
##D    c(23.20312, 45.58329),
##D    c(33.04688, 39.63954)
##D )
##D view_(lawn_point(c(-30, 20)),
##D    lawn_linestring(l1),
##D    lawn_linestring(l2),
##D    lawn_linestring(l3)
##D )
##D 
##D # From a geo_list object from geojsonio package
##D # library("geojsonio")
##D # vecs <- list(c(100.0,0.0), c(101.0,0.0), c(101.0,1.0),
##D #  c(100.0,1.0), c(100.0,0.0))
##D # x <- geojson_list(vecs, geometry="polygon")
##D # view_(x)
##D # view_(x, lawn_point(c(101, 0)))
## End(Not run)



