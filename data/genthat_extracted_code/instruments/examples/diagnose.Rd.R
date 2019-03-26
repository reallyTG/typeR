library(instruments)


### Name: diagnose
### Title: Diagnose problems with iv models.
### Aliases: diagnose
### Keywords: instrument

### ** Examples

# Fake data
N <- 1000
z <- rnorm(N, 1, 1)
q <- rnorm(N, 0, 1)
error <- rnorm(N, 1, 1)
x <- z + error + rnorm(N, 1, 1)
y <- x + error

# Fit OLS
fit_ols <- lm(formula = y ~ x)

# Fit 2SLS
fit_2sls <- iv.lm(y ~ x, x ~ z + q)

diagnose(fit_2sls)



