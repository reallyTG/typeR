library(lmomco)


### Name: are.pargno.valid
### Title: Are the Distribution Parameters Consistent with the Generalized
###   Normal Distribution
### Aliases: are.pargno.valid
### Keywords: utility (distribution) Distribution: Generalized Normal
###   utility (distribution, parameter validation)

### ** Examples

para <- pargno(lmoms(c(123,34,4,654,37,78)))
if(are.pargno.valid(para)) Q <- quagno(0.5,para)



