library(lmomco)


### Name: are.parln3.valid
### Title: Are the Distribution Parameters Consistent with the 3-Parameter
###   Log-Normal Distribution
### Aliases: are.parln3.valid
### Keywords: utility (distribution) Distribution: Log-Normal (3-parameter)
###   utility (distribution, parameter validation)

### ** Examples

para <- parln3(lmoms(c(123,34,4,654,37,78)))
if(are.parln3.valid(para)) Q <- qualn3(0.5,para)



