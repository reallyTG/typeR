library(lmomco)


### Name: are.parlap.valid
### Title: Are the Distribution Parameters Consistent with the Laplace
###   Distribution
### Aliases: are.parlap.valid
### Keywords: utility (distribution) Distribution: Laplace utility
###   (distribution, parameter validation)

### ** Examples

para <- parlap(lmoms(c(123,34,4,654,37,78)))
if(are.parlap.valid(para)) Q <- qualap(0.5,para)



