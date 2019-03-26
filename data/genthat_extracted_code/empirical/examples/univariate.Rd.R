library(empirical)


### Name: univariate
### Title: Nonparametric Univariate Probability Distributions
### Aliases: epdfuv ecdfuv ecdfuv.inverse

### ** Examples

#construct an empirical univariate probability density function
#and then evaluate it
data (trees)
attach (trees)
epdfuv.f = epdfuv (Height)
epdfuv.f (80)



