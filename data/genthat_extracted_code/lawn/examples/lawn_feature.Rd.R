library(lawn)


### Name: lawn_feature
### Title: Create a Feature
### Aliases: lawn_feature

### ** Examples

## Not run: 
##D # points
##D ## single point
##D pt <- '{"type":"Point","coordinates":[-75.343,39.984]}'
##D lawn_feature(pt)
##D 
##D ## with properties
##D lawn_feature(pt, properties = list(foo = "bar"))
##D 
##D ## many points in a list
##D pts <- list(
##D    lawn_point(c(-75.343, 39.984))$geometry,
##D    lawn_point(c(-75.833, 39.284))$geometry,
##D    lawn_point(c(-75.534, 39.123))$geometry
##D )
##D lapply(pts, lawn_feature)
## End(Not run)



