library(VGAM)


### Name: weibull.mean
### Title: Weibull Distribution Family Function, Parameterized by the Mean
### Aliases: weibull.mean
### Keywords: models regression

### ** Examples

wdata <- data.frame(x2 = runif(nn <- 1000))  # Complete data
wdata <- transform(wdata, mu     = exp(-1 + 1 * x2),
                          x3     = rnorm(nn),
                          shape1 = exp(1),
                          shape2 = exp(2))
wdata <- transform(wdata,
  y1 = rweibull(nn, shape = shape1, scale = mu / gamma(1 + 1/shape1)),
  y2 = rweibull(nn, shape = shape2, scale = mu / gamma(1 + 1/shape2)))
fit <- vglm(cbind(y1, y2) ~ x2 + x3, weibull.mean, data = wdata, trace = TRUE)
coef(fit, matrix = TRUE)
sqrt(diag(vcov(fit)))  # SEs
summary(fit, presid = FALSE)



