library(lawn)


### Name: lawn_collect
### Title: Collect method
### Aliases: lawn_collect

### ** Examples

ex_polys <- lawn_data$polygons_aggregate
ex_pts <- lawn_data$points_aggregate
res <- lawn_collect(ex_polys, ex_pts, 'population', 'stuff')
res$type
res$features
res$features$properties

## Not run: 
##D lawn_collect(ex_polys, ex_pts, 'population', 'stuff') %>% view
## End(Not run)



