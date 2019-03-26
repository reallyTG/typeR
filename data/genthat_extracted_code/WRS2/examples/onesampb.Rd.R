library(WRS2)


### Name: onesampb
### Title: One-sample percentile bootstrap
### Aliases: onesampb
### Keywords: models

### ** Examples

set.seed(123)
x <- rnorm(30)
onesampb(x, nboot = 100)    ## H0: Psi = 0

set.seed(123)
x <- rlnorm(30)
onesampb(x, est = "median", nv = 1)   ## H0: median = 1



