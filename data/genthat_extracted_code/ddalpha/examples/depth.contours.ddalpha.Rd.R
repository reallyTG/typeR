library(ddalpha)


### Name: depth.contours.ddalpha
### Title: Depth Contours
### Aliases: depth.contours.ddalpha
### Keywords: visualization

### ** Examples


## Not run: 
##D 
##D par(mfrow = c(2,2))
##D data(hemophilia)
##D 
##D ddalpha = ddalpha.train(hemophilia, depth = "none")
##D depth.contours.ddalpha(ddalpha, main = "data")
##D 
##D for (depth in c("zonoid", "Mahalanobis", "projection", "spatial")){
##D   ddalpha = ddalpha.train(hemophilia, depth = depth)
##D   depth.contours.ddalpha(ddalpha, main = depth)
##D }
##D 
##D for (depth in c("halfspace", "simplicial", "simplicialVolume")){
##D   ddalpha = ddalpha.train(hemophilia, depth = depth, exact = T)
##D   depth.contours.ddalpha(ddalpha, main = depth)
##D }
##D 
##D 
## End(Not run)



