library(empirical)


### Name: multivariate
### Title: Nonparametric Multivariate Probability Distributions
### Aliases: epdfmv ecdfmv

### ** Examples

#construct an empirical multivariate probability density function
#and then evaluate it
data (trees)
attach (trees)
epdfmv.f = epdfmv (cbind (Height, Volume) )
epdfmv.f (c (80, 30) )



