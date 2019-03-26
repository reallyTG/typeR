library(lmomco)


### Name: are.pargam.valid
### Title: Are the Distribution Parameters Consistent with the Gamma
###   Distribution
### Aliases: are.pargam.valid
### Keywords: utility (distribution) Distribution: Gamma utility
###   (distribution, parameter validation) Distribution: Generalized Gamma

### ** Examples

para <- pargam(lmoms(c(123,34,4,654,37,78)))
if(are.pargam.valid(para)) Q <- quagam(0.5,para)



