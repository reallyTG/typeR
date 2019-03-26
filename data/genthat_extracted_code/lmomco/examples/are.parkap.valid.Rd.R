library(lmomco)


### Name: are.parkap.valid
### Title: Are the Distribution Parameters Consistent with the Kappa
###   Distribution
### Aliases: are.parkap.valid
### Keywords: utility (distribution) Distribution: Kappa utility
###   (distribution, parameter validation)

### ** Examples

para <- parkap(lmoms(c(123,34,4,654,37,78)))
if(are.parkap.valid(para)) Q <- quakap(0.5,para)



