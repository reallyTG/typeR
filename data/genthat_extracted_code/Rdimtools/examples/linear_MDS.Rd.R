library(Rdimtools)


### Name: do.mds
### Title: (Classical) Multidimensional Scaling
### Aliases: do.mds

### ** Examples

## Not run: 
##D ## generate data
##D X <- rbind(matrix(rnorm(100),nr=10),matrix(rnorm(100),nr=10)+10)
##D 
##D ## 1. projection onto 2 dimension.
##D output1 <- do.mds(X,ndim=2)
##D 
##D ## 2. different preprocessing leads to different results
##D output2 <- do.mds(X,ndim=2,preprocess="decorrelate")
##D output3 <- do.mds(X,ndim=2,preprocess="whiten")
##D 
##D ## 3. visualize
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="center")
##D plot(output2$Y[,1],output2$Y[,2],main="decorrelate")
##D plot(output3$Y[,1],output3$Y[,2],main="whiten")
## End(Not run)




