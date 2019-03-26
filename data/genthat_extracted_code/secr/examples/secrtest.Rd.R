library(secr)


### Name: secrtest
### Title: Goodness-of-fit Test Results
### Aliases: secrtest print.secrtest plot.secrtest
### Keywords: classes

### ** Examples


## Not run: 
##D tmp <- secr.test(ovenbird.model.1)
##D if (inherits(tmp, 'secrtest')) {
##D     tmp  ## terse print
##D     print(tmp, terse = FALSE)
##D     par(mfrow = c(1,5))
##D     plot(tmp, main = '', xlim=c(0,1), breaks=seq(0,1,0.05))
##D     par(mfrow = c(1,1))    ## reset to default
##D }
## End(Not run)



