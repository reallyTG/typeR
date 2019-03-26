library(lmomco)


### Name: are.parglo.valid
### Title: Are the Distribution Parameters Consistent with the Generalized
###   Logistic Distribution
### Aliases: are.parglo.valid
### Keywords: utility (distribution) Distribution: Generalized Logistic
###   utility (distribution, parameter validation)

### ** Examples

para <- parglo(lmoms(c(123,34,4,654,37,78)))
if(are.parglo.valid(para)) Q <- quaglo(0.5,para)



