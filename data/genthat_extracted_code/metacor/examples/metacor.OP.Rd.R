library(metacor)


### Name: metacor.OP
### Title: Olkin-Pratt (OP) meta-analytical approach with correlation
###   coefficients as effect sizes
### Aliases: metacor.OP
### Keywords: Statistical Models

### ** Examples

data(lui)
lui <- lui[order(lui$r.FDis),]
test <- metacor.OP(lui$r.FDis, lui$n, lui$label)
test



