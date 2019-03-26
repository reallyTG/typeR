library(ddalpha)


### Name: plot.ddalpha
### Title: Plots for the "ddalpha" Class
### Aliases: plot.ddalpha
### Keywords: visualization

### ** Examples


## Not run: 
##D 
##D 
##D par(mfrow = c(2,2))
##D data(hemophilia)
##D 
##D ddalpha = ddalpha.train(hemophilia, depth = "none")
##D plot(ddalpha, type = "depth.contours", main = "data")
##D plot(ddalpha, type = "ddplot", main = "data", drawsep = F)
##D 
##D for (depth in c("zonoid", "Mahalanobis", "projection", "spatial")){
##D   ddalpha = ddalpha.train(hemophilia, depth = depth)
##D   plot(ddalpha, type = "depth.contours", main = depth, drawsep = T)
##D   plot(ddalpha, type = "ddplot", main = depth)
##D }
##D 
## End(Not run)



