library(lmomco)


### Name: are.parnor.valid
### Title: Are the Distribution Parameters Consistent with the Normal
###   Distribution
### Aliases: are.parnor.valid
### Keywords: utility (distribution) Distribution: Normal utility
###   (distribution, parameter validation)

### ** Examples

para <- parnor(lmoms(c(123,34,4,654,37,78)))
if(are.parnor.valid(para)) Q <- quanor(0.5,para)



