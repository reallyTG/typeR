library(Rdimtools)


### Name: do.mvu
### Title: Maximum Variance Unfolding / Semidefinite Embedding
### Aliases: do.mvu do.sde

### ** Examples

## Not run: 
##D ## generate ribbon-shaped data with the small number of data
##D X = aux.gensamples(dname="ribbon", n=50)
##D 
##D ## 1. standard MVU
##D output1 <- do.mvu(X,ndim=2)
##D 
##D ## 2. standard setting with "kpca"-type projection
##D output2 <- do.mvu(X,ndim=2,projtype="kpca")
##D 
##D ## 3. standard MVU for densly connected graph
##D output3 <- do.mvu(X,ndim=2,type=c("proportion",0.5))
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="standard")
##D plot(output2$Y[,1],output2$Y[,2],main="kpca projection")
##D plot(output3$Y[,1],output3$Y[,2],main="densely connected graph")
## End(Not run)




