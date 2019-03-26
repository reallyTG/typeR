library(lmomco)


### Name: are.parexp.valid
### Title: Are the Distribution Parameters Consistent with the Exponential
###   Distribution
### Aliases: are.parexp.valid
### Keywords: utility (distribution) Distribution: Exponential utility
###   (distribution, parameter validation)

### ** Examples

para <- parexp(lmoms(c(123,34,4,654,37,78)))
if(are.parexp.valid(para)) Q <- quaexp(0.5,para)



