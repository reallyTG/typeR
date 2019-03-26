library(lmomco)


### Name: are.pargum.valid
### Title: Are the Distribution Parameters Consistent with the Gumbel
###   Distribution
### Aliases: are.pargum.valid
### Keywords: utility (distribution) Distribution: Gumbel utility
###   (distribution, parameter validation)

### ** Examples

para <- pargum(lmoms(c(123,34,4,654,37,78)))
if(are.pargum.valid(para)) Q <- quagum(0.5,para)



