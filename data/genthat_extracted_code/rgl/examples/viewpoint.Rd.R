library(rgl)


### Name: viewpoint
### Title: Set up viewpoint
### Aliases: rgl.viewpoint view3d
### Keywords: dynamic

### ** Examples

## Not run: 
##D # animated round trip tour for 10 seconds
##D 
##D rgl.open()
##D shade3d(oh3d(), color = "red")
##D 
##D start <- proc.time()[3]
##D while ((i <- 36*(proc.time()[3] - start)) < 360) {
##D   rgl.viewpoint(i, i/4); 
##D }
## End(Not run)



