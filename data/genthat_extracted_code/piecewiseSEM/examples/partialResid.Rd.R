library(piecewiseSEM)


### Name: partialResid
### Title: Computing partial effects
### Aliases: partialResid

### ** Examples


# Generate data
dat <- data.frame(y = rnorm(100), x1 = rnorm(100), x2 = rnorm(100))

# Build model
model <- lm(y ~ x1 + x2, dat)

# Compute partial residuals of y ~ x1
yresid <- resid(lm(y ~ x2, dat))

xresid <- resid(lm(x1 ~ x2, dat))

plot(yresid, xresid)

# Use partialResid
presid <- partialResid(y ~ x1, model)

plot(presid) # identical plot!




