library(VGAM)


### Name: rigff
### Title: Reciprocal Inverse Gaussian distribution
### Aliases: rigff
### Keywords: models regression

### ** Examples

rdata <- data.frame(y = rchisq(n = 100, df = 14))  # Not 'proper' data!!
fit <- vglm(y ~ 1, rigff, data = rdata, trace = TRUE)
fit <- vglm(y ~ 1, rigff, data = rdata, trace = TRUE, eps = 1e-9, crit = "coef")
summary(fit)



