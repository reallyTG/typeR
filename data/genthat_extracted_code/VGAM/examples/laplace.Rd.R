library(VGAM)


### Name: laplace
### Title: Laplace Distribution
### Aliases: laplace
### Keywords: models regression

### ** Examples

ldata <- data.frame(y = rlaplace(nn <- 100, loc = 2, scale = exp(1)))
fit <- vglm(y  ~ 1, laplace, data = ldata, trace = TRUE, crit = "l")
coef(fit, matrix = TRUE)
Coef(fit)
with(ldata, median(y))

ldata <- data.frame(x = runif(nn <- 1001))
ldata <- transform(ldata, y = rlaplace(nn, loc = 2, scale = exp(-1 + 1*x)))
coef(vglm(y ~ x, laplace(iloc = 0.2, imethod = 2, zero = 1), data = ldata,
          trace = TRUE), matrix = TRUE)



