library(lmomco)


### Name: are.parwei.valid
### Title: Are the Distribution Parameters Consistent with the Weibull
###   Distribution
### Aliases: are.parwei.valid
### Keywords: utility (distribution) Distribution: Weibull utility
###   (distribution, parameter validation)

### ** Examples

para <- parwei(lmoms(c(123,34,4,654,37,78)))
if(are.parwei.valid(para)) Q <- quawei(0.5,para)



