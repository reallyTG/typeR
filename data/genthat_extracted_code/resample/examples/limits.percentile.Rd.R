library(resample)


### Name: CI.percentile
### Title: Bootstrap confidence intervals
### Aliases: CI.percentile CI.t CI.bca CI.bootstrapT
### Keywords: nonparametric htest

### ** Examples

## Not run: 
##D # See full set of examples in resample-package, including different
##D # ways to call all four functions depending on the structure of the data.
##D data(Verizon)
##D CLEC <- with(Verizon, Time[Group == "CLEC"])
##D bootC <- bootstrap(CLEC, mean, seed = 0)
##D bootC2 <- bootstrap(CLEC, c(mean = mean(CLEC), sd = sd(CLEC)), seed = 0)
##D CI.percentile(bootC)
##D CI.t(bootC)
##D CI.bca(bootC)
##D CI.bootstrapT(bootC2)
## End(Not run)



