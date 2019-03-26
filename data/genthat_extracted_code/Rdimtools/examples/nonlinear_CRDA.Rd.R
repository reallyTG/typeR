library(Rdimtools)


### Name: do.crda
### Title: Curvilinear Distance Analysis
### Aliases: do.crda

### ** Examples

## Not run: 
##D ## generate sample data
##D X <- aux.gensamples(n=200)
##D 
##D ## weighted versus binary graph construction
##D out1 <- do.crda(X,weight=TRUE)
##D out2 <- do.crda(X,weight=FALSE)
##D 
##D ## visualize
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1],out1$Y[,2],main="weighted graph")
##D plot(out2$Y[,1],out2$Y[,2],main="binarized graph")
## End(Not run)




