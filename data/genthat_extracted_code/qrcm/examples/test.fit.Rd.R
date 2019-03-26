library(qrcm)


### Name: test.fit
### Title: Goodness-of-Fit Test
### Aliases: test.fit
### Keywords: htest

### ** Examples

y <- rnorm(1000)
m1 <- iqr(y ~ 1, formula.p = ~ I(qnorm(p))) # correct
m2 <- iqr(y ~ 1, formula.p = ~ p)  # misspecified
test.fit(m1, R = 25)
test.fit(m2, R = 25)



