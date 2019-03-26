library(Rdimtools)


### Name: est.correlation
### Title: Correlation Dimension
### Aliases: est.correlation

### ** Examples

## Not run: 
##D ## generate three different dataset
##D X1 = aux.gensamples(dname="swiss")
##D X2 = aux.gensamples(dname="ribbon")
##D X3 = aux.gensamples(dname="twinpeaks")
##D 
##D ## compute
##D out1 = est.correlation(X1)
##D out2 = est.correlation(X2)
##D out3 = est.correlation(X3)
##D 
##D ## visually verify : all should have approximate slope of 2.
##D par(mfrow=c(1,3))
##D plot(log(out1$r), log(out1$Cr), main="swiss roll")
##D plot(log(out2$r), log(out2$Cr), main="ribbon")
##D plot(log(out3$r), log(out3$Cr), main="twinpeaks")
## End(Not run)





