library(empirical)


### Name: conditional
### Title: Nonparametric Conditional Probability Distributions
### Aliases: epdfc ecdfc ecdfc.inverse

### ** Examples

#construct an empirical multivariate probability density function
#and then evaluate it
data (trees)
attach (trees)
epdfc.f = epdfc (Volume, c (Height=80), cbind (Height, Volume) )
epdfc.f (30)



