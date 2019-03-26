library(Rdimtools)


### Name: do.olpp
### Title: Orthogonal Locality Preserving Projection
### Aliases: do.olpp

### ** Examples

## Not run: 
##D ## generate 2 normal groups of data that are far away
##D X = rbind(matrix(rnorm(200),nrow=20), (matrix(rnorm(200),nrow=20)+10))
##D 
##D ##  connecting 10% and 25% of data for graph construction each.
##D output1 <- do.olpp(X,ndim=2,type=c("proportion",0.10))
##D output2 <- do.olpp(X,ndim=2,type=c("proportion",0.25))
##D 
##D ## Visualize
##D #  In theory, it should show two separated groups of data
##D par(mfrow=c(1,2))
##D plot(output1$Y[,1],output1$Y[,2],main="10% connected")
##D plot(output2$Y[,1],output2$Y[,2],main="25% connected")
## End(Not run)




