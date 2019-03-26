library(VGAM)


### Name: betaR
### Title: The Two-parameter Beta Distribution Family Function
### Aliases: betaR
### Keywords: models regression

### ** Examples

bdata <- data.frame(y = rbeta(n = 1000, shape1 = exp(0), shape2 = exp(1)))
fit <- vglm(y ~ 1, betaR(lshape1 = "identitylink", lshape2 = "identitylink"),
            data = bdata, trace = TRUE, crit = "coef")
fit <- vglm(y ~ 1, betaR, data = bdata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)  # Useful for intercept-only models

bdata <- transform(bdata, Y = 5 + 8 * y)  # From 5 to 13, not 0 to 1
fit <- vglm(Y ~ 1, betaR(A = 5, B = 13), data = bdata, trace = TRUE)
Coef(fit)
c(meanY = with(bdata, mean(Y)), head(fitted(fit),2))



