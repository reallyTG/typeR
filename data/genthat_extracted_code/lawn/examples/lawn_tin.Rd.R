library(lawn)


### Name: lawn_tin
### Title: Create a Triangulated Irregular Network
### Aliases: lawn_tin

### ** Examples

pts <- lawn_random(bbox = c(-70, 40, -60, 60))
lawn_tin(pts)
## Not run: 
##D lawn_tin(pts) %>% view
##D lawn_tin(lawn_random(bbox = c(-70, 40, -60, 10))) %>% view
## End(Not run)



