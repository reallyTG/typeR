library(VGAM)


### Name: betaff
### Title: The Two-parameter Beta Distribution Family Function
### Aliases: betaff
### Keywords: models regression

### ** Examples

bdata <- data.frame(y = rbeta(nn <- 1000, shape1 = exp(0), shape2 = exp(1)))
fit1 <- vglm(y ~ 1, betaff, data = bdata, trace = TRUE)
coef(fit1, matrix = TRUE)
Coef(fit1)  # Useful for intercept-only models

# General A and B, and with a covariate
bdata <- transform(bdata, x2 = runif(nn))
bdata <- transform(bdata, mu   = logit(0.5 - x2, inverse = TRUE),
                          prec =   exp(3.0 + x2))  # prec == phi
bdata <- transform(bdata, shape2 = prec * (1 - mu),
                         shape1 = mu * prec)
bdata <- transform(bdata,
                   y = rbeta(nn, shape1 = shape1, shape2 = shape2))
bdata <- transform(bdata, Y = 5 + 8 * y)  # From 5 to 13, not 0 to 1
fit <- vglm(Y ~ x2, data = bdata, trace = TRUE,
            betaff(A = 5, B = 13, lmu = extlogit(min = 5, max = 13)))
coef(fit, matrix = TRUE)



