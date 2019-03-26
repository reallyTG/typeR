library(Rdimtools)


### Name: do.rndproj
### Title: Random Projection
### Aliases: do.rndproj

### ** Examples

## Not run: 
##D ## generate Swiss Roll data of 2,000 data points.
##D X <- aux.gensamples(n=2000)
##D 
##D ## 1. Gaussian projection
##D output1 <- do.rndproj(X,ndim=2)
##D 
##D ## 2. Achlioptas projection
##D output2 <- do.rndproj(X,ndim=2,type="achlioptas")
##D 
##D ## 3. Sparse projection
##D output3 <- do.rndproj(X,type="sparse",s=5)        ## fulfill condition on s
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="Gaussian")
##D plot(output2$Y[,1],output2$Y[,2],main="Arclioptas")
##D plot(output3$Y[,1],output3$Y[,2],main="Sparse")
## End(Not run)




