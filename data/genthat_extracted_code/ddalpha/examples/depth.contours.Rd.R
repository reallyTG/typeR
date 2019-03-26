library(ddalpha)


### Name: depth.contours
### Title: Depth Contours
### Aliases: depth.contours
### Keywords: visualization

### ** Examples


## Not run: 
##D 
##D par(mfrow = c(2,2))
##D data(hemophilia)
##D 
##D depth.contours(hemophilia[,1:2], depth = "none", main = "data")
##D 
##D for (depth in c("zonoid", "Mahalanobis", "projection", "spatial")){
##D   depth.contours(hemophilia[,1:2], depth = depth, main = depth)
##D }
##D 
##D for (depth in c("halfspace", "simplicial", "simplicialVolume")){
##D   depth.contours(hemophilia[,1:2], depth = depth, main = depth, exact = T)
##D }
##D 
##D 
## End(Not run)



