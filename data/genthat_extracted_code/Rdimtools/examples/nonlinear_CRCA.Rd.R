library(Rdimtools)


### Name: do.crca
### Title: Curvilinear Component Analysis
### Aliases: do.crca

### ** Examples

## Not run: 
##D ## generate sample data
##D X <- aux.gensamples(n=200)
##D 
##D ## different initial learning rates
##D out1 <- do.crca(X,alpha=1)
##D out2 <- do.crca(X,alpha=5)
##D out3 <- do.crca(X,alpha=10)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="alpha=1.0")
##D plot(out2$Y[,1],out2$Y[,2],main="alpha=5.0")
##D plot(out3$Y[,1],out3$Y[,2],main="alpha=10.0")
## End(Not run)





