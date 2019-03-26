library(Rdimtools)


### Name: do.ica
### Title: Independent Component Analysis
### Aliases: do.ica

### ** Examples

## Not run: 
##D ## generate data of 100 observations
##D X <- aux.gensamples(n=100)
##D 
##D ## 1. use logcosh function for transformation
##D output1 <- do.ica(X,ndim=2,type="logcosh")
##D 
##D ## 2. use exponential function for transformation
##D output2 <- do.ica(X,ndim=2,type="exp")
##D 
##D ## 3. use polynomial function for transformation
##D output3 <- do.ica(X,ndim=2,type="poly")
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="logcosh")
##D plot(output2$Y[,1],output2$Y[,2],main="exp")
##D plot(output3$Y[,1],output3$Y[,2],main="poly")
## End(Not run)




