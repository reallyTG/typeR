library(compositions)


### Name: varmlm
### Title: Residual variance of a model
### Aliases: var.lm var.mlm
### Keywords: multivariate

### ** Examples

data(Orange)
var(lm(circumference~age,data=Orange))
var(lm(cbind(circumference,age)~age,data=Orange))




