library(mixR)


### Name: select
### Title: Finite Mixture Model Selection by Information Criterion
### Aliases: select

### ** Examples

## selecting the optimal normal mixture model by BIC
set.seed(105)
x <- rmixnormal(1000, c(0.3, 0.4, 0.3), c(-4, 0, 4), c(1, 1, 1))
hist(x, breaks = 40)
ret <- select(x, ncomp = 2:5)
## [1] "The final model: normal mixture (equal variance) with 3 components"

## (not run) selecting the optimal Weibull mixture model by BIC
## set.seed(106)
## x <- rmixweibull(1000, c(0.3, 0.4, 0.3), c(2, 5, 8), c(0.7, 0.6, 1))
## ret <- select(x, ncomp = 2:5, family = "weibull")
## [1] "The final model: weibull mixture with 3 components"

## (not run) selecting the optimal Gamma mixture model by BIC
## set.seed(107)
## x <- rmixgamma(1000, c(0.3, 0.7), c(2, 5), c(0.7, 1))
## ret <- select(x, ncomp = 2:5, family = "gamma")
## [1] "The final model: gamma mixture with 2 components"


## (not run) selecting the optimal lognormal mixture model by BIC
## set.seed(108)
## x <- rmixlnorm(1000, c(0.2, 0.3, 0.2, 0.3), c(4, 7, 9, 12), c(1, 0.5, 0.7, 1))
## ret <- select(x, ncomp = 2:6, family = "lnorm")
## [1] "The final model: lnorm mixture with 4 components"




