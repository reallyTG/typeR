library(lmomco)


### Name: are.parwak.valid
### Title: Are the Distribution Parameters Consistent with the Wakeby
###   Distribution
### Aliases: are.parwak.valid
### Keywords: utility (distribution) Distribution: Wakeby utility
###   (distribution, parameter validation)

### ** Examples

para <- parwak(lmoms(c(123,34,4,654,37,78)))
if(are.parwak.valid(para)) Q <- quawak(0.5,para)



