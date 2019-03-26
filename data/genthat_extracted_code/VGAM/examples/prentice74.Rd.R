library(VGAM)


### Name: prentice74
### Title: Prentice (1974) Log-gamma Distribution
### Aliases: prentice74
### Keywords: models regression

### ** Examples

pdata <- data.frame(x2 = runif(nn <- 1000))
pdata <- transform(pdata, loc = -1 + 2*x2, Scale = exp(1))
pdata <- transform(pdata, y = rlgamma(nn, loc = loc, scale = Scale, shape = 1))
fit <- vglm(y ~ x2, prentice74(zero = 2:3), data = pdata, trace = TRUE)
coef(fit, matrix = TRUE)  # Note the coefficients for location



