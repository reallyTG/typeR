library(VGAM)


### Name: inv.gaussianff
### Title: Inverse Gaussian Distribution Family Function
### Aliases: inv.gaussianff
### Keywords: models regression

### ** Examples

idata <- data.frame(x2 = runif(nn <- 1000))
idata <- transform(idata, mymu   = exp(2 + 1 * x2),
                          Lambda = exp(2 + 1 * x2))
idata <- transform(idata, y = rinv.gaussian(nn, mu = mymu, lambda = Lambda))
fit1 <-   vglm(y ~ x2, inv.gaussianff, data = idata, trace = TRUE)
rrig <- rrvglm(y ~ x2, inv.gaussianff, data = idata, trace = TRUE)
coef(fit1, matrix = TRUE)
coef(rrig, matrix = TRUE)
Coef(rrig)
summary(fit1)



