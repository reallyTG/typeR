library(Rdimtools)


### Name: do.iltsa
### Title: Improved Local Tangent Space Alignment
### Aliases: do.iltsa

### ** Examples

## Not run: 
##D ## generate ribbon-shaped data
##D X = aux.gensamples(dname="ribbon", n=200)
##D 
##D ## try different bandwidth size
##D out1 <- do.iltsa(X, t=1)
##D out2 <- do.iltsa(X, t=100)
##D out3 <- do.iltsa(X, t=Inf)
##D 
##D ## Visualize two comparisons
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="ILTSA::t=1")
##D plot(out2$Y[,1], out2$Y[,2], main="ILTSA::t=100")
##D plot(out3$Y[,1], out3$Y[,2], main="ILTSA::t=Inf")
## End(Not run)




