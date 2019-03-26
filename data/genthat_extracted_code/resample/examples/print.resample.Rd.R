library(resample)


### Name: print.resample
### Title: Methods for common generic functions for resample objects
### Aliases: plot.resample hist.resample qqnorm.resample print.resample
###   quantile.resample
### Keywords: nonparametric htest

### ** Examples

## Not run: 
##D # See full set of examples in resample-package
##D data(Verizon)
##D CLEC <- with(Verizon, Time[Group == "CLEC"])
##D bootC <- bootstrap(CLEC, mean, seed = 0)
##D print(bootC)
##D hist(bootC)
##D qqnorm(bootC)
##D quantile(bootC, probs = c(.25, .975))
##D # That is the percentile interval with expand = FALSE
##D CI.percentile(bootC)
## End(Not run)



