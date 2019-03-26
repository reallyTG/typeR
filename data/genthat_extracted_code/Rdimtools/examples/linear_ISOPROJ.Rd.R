library(Rdimtools)


### Name: do.isoproj
### Title: Isometric Projection
### Aliases: do.isoproj

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(n=28)
##D 
##D ## 1. connecting 10% of data for graph construction.
##D output1 <- do.isoproj(X,ndim=2,type=c("proportion",0.10))
##D 
##D ## 2. constructing 25%-connected graph
##D output2 <- do.isoproj(X,ndim=2,type=c("proportion",0.25))
##D 
##D ## Visualize two different projections
##D par(mfrow=c(1,2))
##D plot(output1$Y[,1],output1$Y[,2],main="10%")
##D plot(output2$Y[,1],output2$Y[,2],main="25%")
## End(Not run)




