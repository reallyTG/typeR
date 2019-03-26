library(rriskDistributions)


### Name: rriskFitdist.cont
### Title: Fitting univariate distributions by maximum likelihood or by
###   matching moments
### Aliases: rriskFitdist.cont
### Keywords: fitdistrplus

### ** Examples

set.seed(1)
x <- stats::rnorm(5000, mean = 10, sd = 5)
rriskFitdist.cont(x, "norm")
rriskFitdist.cont(x, "t")




