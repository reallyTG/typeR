library(rich)


### Name: rarc
### Title: Computes rarefaction curves and statistical envelop
### Aliases: rarc

### ** Examples

## Not run: 
##D data(ef)
##D t <- rarc(ef,samplesize=c(5,10,15,20,25), nrandom=30, p1=0.975, p2=0.025)
##D head(t)
##D 
##D # Plot the outputs
##D plot(t$out[,6],t$out[,1], type="b", ylim=range(c(t$out[,2],t$out[,3])),
##D 	xlab="number of sampling units", ylab="richness")
##D points(t$out[,6] , t$out[,2], type="l", col="red")
##D points(t$out[,6] , t$out[,3], type="l", col="blue")
## End(Not run)

#See the package vignette for more examples. Type: vignette("rich_introduction").



