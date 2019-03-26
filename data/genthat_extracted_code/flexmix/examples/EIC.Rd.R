library(flexmix)


### Name: EIC
### Title: Entropic Measure Information Criterion
### Aliases: EIC EIC,flexmix-method EIC,stepFlexmix-method
### Keywords: methods

### ** Examples

data("NPreg", package = "flexmix")
ex1 <- flexmix(yn ~ x + I(x^2), data = NPreg, k = 2)
EIC(ex1)



