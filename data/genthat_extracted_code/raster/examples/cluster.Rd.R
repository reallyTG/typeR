library(raster)


### Name: cluster
### Title: Use a multi-core cluster
### Aliases: beginCluster endCluster clusterR
### Keywords: spatial

### ** Examples


## Not run: 
##D # set up the cluster object for parallel computing
##D beginCluster()
##D 
##D r <- raster()
##D r[] <- 1:ncell(r)
##D 
##D x <- clusterR(r, sqrt, verbose=T)
##D 
##D f1 <- function(x) calc(x, sqrt)
##D y <- clusterR(r, f1)
##D 
##D s <- stack(r, r*2, r*3)
##D f2 <- function(d,e,f) (d + e) / (f * param)
##D param <- 122
##D ov <- clusterR(s, overlay, args=list(fun=f2), export='param')
##D 
##D pts <- matrix(c(0,0, 45,45), ncol=2, byrow=T)
##D d <- clusterR(r, distanceFromPoints, args=list(xy=pts))
##D 
##D values(r) <- runif(ncell(r))
##D m <- c(0, 0.25, 1,  0.25, 0.5, 2,  0.5, 1, 3)
##D m <- matrix(m, ncol=3, byrow=TRUE)
##D rc1 <- clusterR(r, reclassify, args=list(rcl=m, right=FALSE), 
##D                filename='rcltest.grd', datatype='INT2S', overwrite=TRUE)
##D 
##D # equivalent to:
##D rc2 <- reclassify(r, rcl=m, right=FALSE, filename='rcltest.grd', datatype='INT2S', overwrite=TRUE)
##D 
##D 
##D # example with the calc function
##D a <- 10
##D f3 <- function(x) sum(x)+a
##D 
##D z1 <- clusterR(s, calc, args=list(fun=f3), export='a')
##D 
##D # for some raster functions that use another function as an argument 
##D # you can write your own parallel function instead of using clusterR
##D # get cluster object created with beginCluster
##D cl <- getCluster()  
##D 
##D library(parallel)
##D clusterExport(cl, "a")
##D z2 <- calc(s, fun=function(x){ parApply(cl, x, 1, f3)} )
##D # set flag that cluster is available again
##D returnCluster()
##D #
##D 
##D # done with cluster object		
##D endCluster()
## End(Not run)



