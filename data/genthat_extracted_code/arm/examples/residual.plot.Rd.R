library(arm)


### Name: residual.plot
### Title: residual plot for the observed values
### Aliases: residual.plot
### Keywords: hplot

### ** Examples

old.par <- par(no.readonly = TRUE)

x <- rnorm(100)
y <- rnorm(100)
fit <- lm(y~x)
y.hat <- fitted(fit)
u <- resid(fit)
sigma <- sigma.hat(fit)
residual.plot(y.hat, u, sigma)

par(old.par)



