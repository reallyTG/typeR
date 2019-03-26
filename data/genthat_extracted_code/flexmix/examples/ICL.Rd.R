library(flexmix)


### Name: ICL
### Title: Integrated Completed Likelihood Criterion
### Aliases: ICL,flexmix-method ICL,stepFlexmix-method
### Keywords: methods

### ** Examples

data("NPreg", package = "flexmix")
ex1 <- flexmix(yn ~ x + I(x^2), data = NPreg, k = 2)
ICL(ex1)



