library(lmomco)


### Name: are.parray.valid
### Title: Are the Distribution Parameters Consistent with the Rayleigh
###   Distribution
### Aliases: are.parray.valid
### Keywords: utility (distribution) Distribution: Rayleigh utility
###   (distribution, parameter validation)

### ** Examples

para <- parray(lmoms(c(123,34,4,654,37,78)))
if(are.parray.valid(para)) Q <- quaray(0.5,para)



