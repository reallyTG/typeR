library(gee4)


### Name: bootcurve
### Title: Plot Fitted Curves and Corresponding Confidence Interval using
###   bootstrapping method
### Aliases: bootcurve

### ** Examples

## Not run: 
##D # It may take hours for large bootstrap replications
##D fitgee.ar1 <- geer(cd4|id|time ~ 1|1, data = aids, triple = c(6,3,3),
##D   method = 'gee-mcd', corr.struct = 'ar1', rho = 0.5,
##D   control = geerControl(trace=TRUE))
##D bootcurve(fitgee.ar1, nboot = 1000)
## End(Not run)




