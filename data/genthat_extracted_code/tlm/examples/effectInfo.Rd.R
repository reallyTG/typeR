library(tlm)


### Name: effectInfo
### Title: Interpretation of Effects in Linear, Logistic and Poisson Models
###   with Transformed Variables
### Aliases: effectInfo print.effectInfo
### Keywords: ~kwd1 ~kwd2

### ** Examples

### Linear model with log transformation in the explanatory variable:
data(cotinine)
head(cotinine)
# model fitting:
modcot <- tlm(y = weight, x = logcotinine, data = cotinine, xpow = 0)
modcot
# information on interpreting the effect:
effectInfo(modcot)

### Linear model with no summary measure of effect:
data(glucose)
head(glucose)
# transformations Y^(-2) and X^(-1/2): 
modgluco <- tlm(y = inv2glu, x = inv12tri, data = glucose, ypow = -2, xpow = -1/2)
modgluco
effectInfo(modgluco)



