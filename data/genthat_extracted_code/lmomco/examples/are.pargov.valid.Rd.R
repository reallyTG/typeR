library(lmomco)


### Name: are.pargov.valid
### Title: Are the Distribution Parameters Consistent with the
###   Govindarajulu Distribution
### Aliases: are.pargov.valid
### Keywords: utility (distribution) Distribution: Govindarajulu utility
###   (distribution, parameter validation)

### ** Examples

para <- pargov(lmoms(c(123,34,4,654,37,78)))
if(are.pargov.valid(para)) Q <- quagov(0.5,para)



