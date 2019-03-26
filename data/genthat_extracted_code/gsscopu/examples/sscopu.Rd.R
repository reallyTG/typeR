library(gsscopu)


### Name: sscopu
### Title: Estimating Copula Density Using Smoothing Splines
### Aliases: sscopu sscopu2
### Keywords: smooth models distribution

### ** Examples

## simulate 2-D data
x <- matrix(runif(200),100,2)
## fit copula density
fit <- sscopu(x)
## "same fit"
fit2 <- sscopu2(x,id=fit$id)
## symmetric fit
fit.s <- sscopu(x,sym=TRUE,id=fit$id)
## Kendall's tau and Spearman's rho
summary(fit); summary(fit2); summary(fit.s)
## clean up
## Not run: rm(x,fit,fit2,fit.s)



