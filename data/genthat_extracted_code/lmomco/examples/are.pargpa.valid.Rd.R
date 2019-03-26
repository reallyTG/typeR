library(lmomco)


### Name: are.pargpa.valid
### Title: Are the Distribution Parameters Consistent with the Generalized
###   Pareto Distribution
### Aliases: are.pargpa.valid
### Keywords: utility (distribution) Distribution: Generalized Pareto
###   utility (distribution, parameter validation)

### ** Examples

para <- pargpa(lmoms(c(123,34,4,654,37,78)))
if(are.pargpa.valid(para)) Q <- quagpa(0.5,para)



