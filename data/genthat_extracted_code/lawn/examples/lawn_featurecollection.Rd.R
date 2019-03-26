library(lawn)


### Name: lawn_featurecollection
### Title: Create a FeatureCollection
### Aliases: lawn_featurecollection

### ** Examples

## Not run: 
##D # points
##D ## single point
##D pt <- lawn_point(c(-75.343, 39.984), properties = list(name = 'Location A'))
##D lawn_featurecollection(pt)
##D 
##D ## many points in a list
##D features <- list(
##D    lawn_point(c(-75.343, 39.984), properties = list(name = 'Location A')),
##D    lawn_point(c(-75.833, 39.284), properties = list(name = 'Location B')),
##D    lawn_point(c(-75.534, 39.123), properties = list(name = 'Location C'))
##D )
##D lawn_featurecollection(features)
##D 
##D # polygons
##D rings <- list(list(
##D    c(-2.275543, 53.464547),
##D    c(-2.275543, 53.489271),
##D    c(-2.215118, 53.489271),
##D    c(-2.215118, 53.464547),
##D    c(-2.275543, 53.464547)
##D ))
##D ## single polygon
##D lawn_featurecollection(lawn_polygon(rings))
##D 
##D ## many polygons in a list
##D rings2 <- list(list(
##D    c(-2.775543, 54.464547),
##D    c(-2.775543, 54.489271),
##D    c(-2.245118, 54.489271),
##D    c(-2.245118, 54.464547),
##D    c(-2.775543, 54.464547)
##D ))
##D features <- list(
##D    lawn_polygon(rings, properties = list(name = 'poly1', population = 400)),
##D    lawn_polygon(rings2, properties = list(name = 'poly2', population = 5000))
##D )
##D lawn_featurecollection(features)
##D 
##D # linestrings
##D pts1 <- list(
##D    c(-2.364416, 53.448203),
##D    c(-2.356176, 53.441316),
##D    c(-2.33901, 53.435924),
##D    c(-2.327337, 53.436673)
##D )
##D ## single linestring
##D lawn_featurecollection(lawn_linestring(pts1))
##D 
##D ## many linestring's in a list
##D pts2 <- rapply(pts1, function(x) x+0.1, how = "list")
##D features <- list(
##D    lawn_linestring(pts1, properties = list(name = 'line1', distance = 145)),
##D    lawn_linestring(pts2, properties = list(name = 'line2', distance = 145))
##D )
##D lawn_featurecollection(features)
##D 
##D # mixed feature set: polygon, linestring, and point
##D features <- list(
##D    lawn_polygon(rings, properties = list(name = 'poly1', population = 400)),
##D    lawn_linestring(pts1, properties = list(name = 'line1', distance = 145)),
##D    lawn_point(c(-2.25, 53.479271), properties = list(name = 'Location A'))
##D )
##D lawn_featurecollection(features)
##D 
##D # Return self if a featurecollection class passed
##D res <- lawn_featurecollection(features)
##D lawn_featurecollection(res)
##D 
##D # json featurecollection passed in
##D library("jsonlite")
##D str <- toJSON(unclass(res))
##D lawn_featurecollection(str)
##D 
##D # from a centroid object
##D poly <- '{
##D   "type": "Feature",
##D   "properties": {},
##D   "geometry": {
##D     "type": "Polygon",
##D     "coordinates": [[
##D       [105.818939,21.004714],
##D       [105.818939,21.061754],
##D       [105.890007,21.061754],
##D       [105.890007,21.004714],
##D       [105.818939,21.004714]
##D      ]]
##D   }
##D }'
##D cent <- lawn_centroid(poly)
##D lawn_featurecollection(cent)
##D 
##D # from a feature
##D pt <- '{
##D  "type": "Feature",
##D  "properties": {},
##D  "geometry": {
##D    "type": "Point",
##D    "coordinates": [-90.548630, 14.616599]
##D   }
##D }'
##D x <- lawn_buffer(pt, 5)
##D lawn_featurecollection(x)
##D 
##D # From a geo_list object from geojsonio package
##D # library("geojsonio")
##D # vecs <- list(c(100.0,0.0), c(101.0,0.0), c(101.0,1.0), c(100.0,1.0),
##D #   c(100.0,0.0))
##D # x <- geojson_list(vecs, geometry="polygon")
##D # lawn_featurecollection(x)
## End(Not run)



