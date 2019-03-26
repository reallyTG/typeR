library(instruments)


### Name: iv.lm
### Title: Estimate linear regression models with an instrumental variable.
### Aliases: iv.lm
### Keywords: instrument

### ** Examples

# Fake data
N <- 1000
z <- rnorm(N, 1, 1)
error <- rnorm(N, 1, 1)
x <- z + error + rnorm(N, 1, 1)
y <- x + error

# Fit OLS
fit_ols <- lm(y ~ x)

# Fit 2SLS
fit_2sls <- iv.lm(y ~ x, x ~ z)

summary(fit_ols)
summary(fit_2sls)



