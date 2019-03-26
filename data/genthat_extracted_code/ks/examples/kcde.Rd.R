library(ks)


### Name: kcde
### Title: Kernel cumulative distribution/survival function estimate
### Aliases: kcde Hpi.kcde Hpi.diag.kcde hpi.kcde predict.kcde
### Keywords: smooth

### ** Examples

library(MASS)
data(iris)
Fhat <- kcde(iris[,1:2])  
predict(Fhat, x=as.matrix(iris[,1:2]))

## See other examples in ? plot.kcde



