library(hydroApps)


### Name: parBurrXII.approx
### Title: Parameters of the Extended Burr type XII distribution
### Aliases: parBurrXII.approx tau3BurrXII.WeibullBound
###   tau3BurrXII.ParetoBound

### ** Examples

## compute parameters from L-moments
parburr <- parBurrXII.approx(L1=2, tau=0.45, tau3=0.51)
parburr 

## Not run: 
##D ## plot the validity domain in the tau-tau3 space
##D tau = seq(0, 1, by=0.02)
##D plot(tau, tau3BurrXII.WeibullBound(tau), type="l", lwd=2, ylim=c(-.2, 1))
##D lines(tau, tau3BurrXII.ParetoBound(tau), lwd=2)
## End(Not run)




