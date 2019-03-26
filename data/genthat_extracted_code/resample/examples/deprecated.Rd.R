library(resample)


### Name: deprecated.resample
### Title: Deprecated functions.
### Aliases: limits.percentile limits.t limits.bootstrapT
### Keywords: nonparametric htest

### ** Examples

## Not run: 
##D # See full set of examples in resample-package, including different
##D # ways to call all four functions depending on the structure of the data.
##D data(Verizon)
##D CLEC <- with(Verizon, Time[Group == "CLEC"])
##D bootC <- bootstrap(CLEC, mean, seed = 0)
##D bootC2 <- bootstrap(CLEC, c(mean = mean(CLEC), sd = sd(CLEC)), seed = 0)
##D limits.percentile(bootC)
##D limits.t(bootC)
##D limits.bootstrapT(bootC2)
## End(Not run)



