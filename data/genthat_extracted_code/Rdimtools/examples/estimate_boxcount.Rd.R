library(Rdimtools)


### Name: est.boxcount
### Title: Box-counting Dimension
### Aliases: est.boxcount

### ** Examples

## Not run: 
##D ## generate three different dataset
##D X1 = aux.gensamples(dname="swiss")
##D X2 = aux.gensamples(dname="ribbon")
##D X3 = aux.gensamples(dname="twinpeaks")
##D 
##D ## compute boxcount dimension
##D out1 = est.boxcount(X1)
##D out2 = est.boxcount(X2)
##D out3 = est.boxcount(X3)
##D 
##D ## visually verify : all should have approximate slope of 2.
##D par(mfrow=c(1,3))
##D plot(log(1/out1$r), log(out1$Nr), main="swiss roll")
##D plot(log(1/out2$r), log(out2$Nr), main="ribbon")
##D plot(log(1/out3$r), log(out3$Nr), main="twinpeaks")
## End(Not run)




