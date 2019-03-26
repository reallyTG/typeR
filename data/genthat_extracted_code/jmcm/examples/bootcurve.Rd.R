library(jmcm)


### Name: bootcurve
### Title: Plot Fitted Curves and Corresponding Confidence Interval using
###   bootstrapping method
### Aliases: bootcurve

### ** Examples

## Not run: 
##D # It may take hours for large bootstrap replications
##D fit.mcd <- jmcm(I(sqrt(cd4)) | id | time ~ 1 | 1, data=aids,
##D   triple = c(8, 1, 3), cov.method = 'mcd', control = jmcmControl(trace=T))
##D bootcurve(fit.mcd, nboot = 1000)
## End(Not run)




