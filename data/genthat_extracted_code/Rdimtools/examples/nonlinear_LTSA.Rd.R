library(Rdimtools)


### Name: do.ltsa
### Title: Local Tangent Space Alignment
### Aliases: do.ltsa

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(dname="cswiss",n=100)
##D 
##D ## 1. use 10%-connected graph
##D output1 <- do.ltsa(X,ndim=2)
##D 
##D ## 2. use 25%-connected graph
##D output2 <- do.ltsa(X,ndim=2,type=c("proportion",0.25))
##D 
##D ## 3. use 50%-connected graph
##D output3 <- do.ltsa(X,ndim=2,type=c("proportion",0.50))
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="10%")
##D plot(output2$Y[,1],output2$Y[,2],main="25%")
##D plot(output3$Y[,1],output3$Y[,2],main="50%")
## End(Not run)




