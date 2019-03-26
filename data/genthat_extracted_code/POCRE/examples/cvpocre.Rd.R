library(POCRE)


### Name: cvpocre
### Title: Use k-Fold Cross-Validation to Choose the Tuning Parameter for
###   POCRE
### Aliases: cvpocre

### ** Examples

## Not run: 
##D data(simdata)
##D n <- dim(simdata)[1]
##D xx <- simdata[,-1]
##D yy <- simdata[,1]
##D 
##D # tp <- cvpocre(yy,xx,delta=0.01)
##D tp <- cvpocre(yy,xx)
##D print(paste("  pocre: Optimal Tuning Parameter = ", tp))
##D cvpres <- pocre(yy,xx,lambda=tp,maxvar=n/log(n))
## End(Not run)



