library(lawn)


### Name: lawn_square
### Title: Calculate a square bounding box
### Aliases: lawn_square

### ** Examples

bbox <- c(-20, -20, -15, 0)
lawn_square(bbox)
## Not run: 
##D sq <- lawn_square(bbox)
##D lawn_featurecollection(list(lawn_bbox_polygon(bbox),
##D   lawn_bbox_polygon(sq))) %>% view
## End(Not run)



