library(VGAM)


### Name: simplex
### Title: Simplex Distribution Family Function
### Aliases: simplex
### Keywords: models regression

### ** Examples

sdata <- data.frame(x2 = runif(nn <- 1000))
sdata <- transform(sdata, eta1 = 1 + 2 * x2,
                          eta2 = 1 - 2 * x2)
sdata <- transform(sdata, y = rsimplex(nn, mu = logit(eta1, inverse = TRUE),
                                       dispersion = exp(eta2)))
(fit <- vglm(y ~ x2, simplex(zero = NULL), data = sdata, trace = TRUE))
coef(fit, matrix = TRUE)
summary(fit)



