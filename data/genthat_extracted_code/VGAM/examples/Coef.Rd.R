library(VGAM)


### Name: Coef
### Title: Computes Model Coefficients and Quantities
### Aliases: Coef
### Keywords: models regression

### ** Examples

nn <- 1000
bdata <- data.frame(y = rbeta(nn, shape1 = 1, shape2 = 3))  # Original scale
fit <- vglm(y ~ 1, betaR, data = bdata, trace = TRUE)  # Intercept-only model
coef(fit, matrix = TRUE)  # Both on a log scale
Coef(fit)  # On the original scale



