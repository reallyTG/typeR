library(resample)


### Name: bootstrap
### Title: One and two sample bootstrap sampling and permutation tests.
### Aliases: bootstrap bootstrap2 permutationTest permutationTest2
### Keywords: nonparametric htest

### ** Examples

## Not run: 
##D # See full set of examples in resample-package, including different
##D # ways to call the functions depending on the structure of the data.
##D data(Verizon)
##D CLEC <- with(Verizon, Time[Group == "CLEC"])
##D bootC <- bootstrap(CLEC, mean)
##D bootC
##D hist(bootC)
##D qqnorm(bootC)
## End(Not run)



