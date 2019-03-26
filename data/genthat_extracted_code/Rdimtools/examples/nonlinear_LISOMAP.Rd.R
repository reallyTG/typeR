library(Rdimtools)


### Name: do.lisomap
### Title: Landmark Isometric Feature Mapping
### Aliases: do.lisomap

### ** Examples

## Not run: 
##D ## generate data
##D ## in order to pass CRAN pretest, n is set to be small.
##D X <- aux.gensamples(n=123)
##D 
##D ## 1. use 10/28 data points with quarter-connected graph
##D output1 <- do.lisomap(X,ndim=2,type=c("proportion",0.25),npoints=10)
##D 
##D ## 2. use 10/28 data points with half-connected graph
##D output2 <- do.lisomap(X,ndim=2,type=c("proportion",0.50),npoints=10)
##D 
##D ## 3. use 14/28 data points with half-connected graph
##D output3 <- do.lisomap(X,ndim=2,type=c("proportion",0.50),npoints=14)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="5%")
##D plot(output2$Y[,1],output2$Y[,2],main="10%")
##D plot(output3$Y[,1],output3$Y[,2],main="50%")
## End(Not run)




