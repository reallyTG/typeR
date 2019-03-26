library(lmomco)


### Name: are.pargev.valid
### Title: Are the Distribution Parameters Consistent with the Generalized
###   Extreme Value Distribution
### Aliases: are.pargev.valid
### Keywords: utility (distribution) Distribution: Generalized Extreme
###   Value utility (distribution, parameter validation)

### ** Examples

para <- pargev(lmoms(c(123,34,4,654,37,78)))
if(are.pargev.valid(para)) Q <- quagev(0.5,para)



