library(distr)


### Name: UnivarDistrList-class
### Title: List of univariate distributions
### Aliases: UnivarDistrList-class
###   coerce,UnivariateDistribution,UnivarDistrList-method
### Keywords: distribution list

### ** Examples

(DL <- new("UnivarDistrList", list(Norm(), Exp())))
plot(DL)
as(Norm(), "UnivarDistrList")



