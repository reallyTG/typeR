library(metaLik)


### Name: test.metaLik
### Title: Hypothesis testing on a scalar fixed-effect component in
###   meta-analysis and meta-regression models
### Aliases: test.metaLik
### Keywords: regression htest

### ** Examples

data(vaccine)
m <- metaLik(y~latitude, data=vaccine, sigma2=sigma2)
## significance test for the intercept coefficient
test.metaLik(m)
## significance test for the 'latitude' coefficient
test.metaLik(m, param=2)
## testing for the 'latitude' coefficient less than 0
test.metaLik(m, param=2, value=0, alternative='less')



