library(metacor)


### Name: metacor.DSL
### Title: DerSimonian-Laird (DSL) meta-analytical approach with
###   correlation coefficients as effect sizes
### Aliases: metacor.DSL
### Keywords: Statistical Models

### ** Examples

data(lui)
lui <- lui[order(lui$r.FDis),]
test <- metacor.DSL(lui$r.FDis, lui$n, lui$label)
test



