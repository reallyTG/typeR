library(ks)


### Name: kdde
### Title: Kernel density derivative estimate
### Aliases: kdde predict.kdde kcurv
### Keywords: smooth

### ** Examples

set.seed(8192)
x <- rmvnorm.mixt(1000, mus=c(0,0), Sigmas=invvech(c(1,0.8,1)))
fhat <- kdde(x=x, deriv.order=1) ## gradient [df/dx, df/dy]
predict(fhat, x=x[1:5,])

## See other examples in ? plot.kdde



