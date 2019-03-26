library(lfe)


### Name: waldtest
### Title: Compute Wald test for joint restrictions on coefficients
### Aliases: waldtest

### ** Examples


x <- rnorm(10000)
x2 <- rnorm(length(x))
y <- x - 0.2*x2 + rnorm(length(x))
#Also works for lm
summary(est <- lm(y ~ x + x2  ))
# We do not reject the true values
waldtest(est, ~ x-1|x2+0.2|`(Intercept)`)
# The Delta-method coincides when the function is linear:
waldtest(est, function(x) x - c(0, 1, -0.2))




