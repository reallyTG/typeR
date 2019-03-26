library(extRemes)


### Name: ci.fevd
### Title: Confidence Intervals
### Aliases: ci.fevd ci.fevd.bayesian ci.fevd.lmoments ci.fevd.mle
### Keywords: htest distribution

### ** Examples


data(Fort)

fit <- fevd(Prec, Fort, threshold = 2, type = "GP",
    units = "inches", verbose = TRUE)

ci(fit, type = "parameter")

## Not run: 
##D ci(fit, type = "return.level", method = "proflik",
##D     xrange = c(3.5,7.75), verbose = TRUE)
##D # Can check using locator(2).
##D 
##D ci(fit, method = "boot")
##D 
## End(Not run)




