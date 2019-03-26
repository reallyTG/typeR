library(DoE.base)


### Name: factorize
### Title: Factorize integer numbers and factors
### Aliases: factorize.factor factorize.design factorize.data.frame
### Keywords: array design

### ** Examples

factorize(12)
factorize(c(2,2,3,3,6))
factorize(fac.design(nlevels=c(2,2,3,3,6)))
unlist(factorize(c(2,2,3,3,6)))
factorize(undesign(fac.design(nlevels=c(2,2,3,3,6))))



