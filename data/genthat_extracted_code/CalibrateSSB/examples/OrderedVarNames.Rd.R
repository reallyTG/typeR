library(CalibrateSSB)


### Name: OrderedVarNames
### Title: OrderedVarNames
### Aliases: OrderedVarNames
### Keywords: internal

### ** Examples

z <- data.frame(A = factor(c("a", "b", "c")), B = factor(1:2), C = 1:6)
x <- colnames(model.matrix(~B * C * A, z))
OrderedVarNames(x)



