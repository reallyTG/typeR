library(aods3)


### Name: wald.test
### Title: Wald Test for Model Coefficients
### Aliases: wald.test print.wald.test
### Keywords: htest

### ** Examples

data(orob2)
fm <- aodql(cbind(m, n - m) ~ seed * root, data = orob2, family = "qbin")
# Wald chi2 test for the effect of root
wald.test(b = coef(fm), varb = vcov(fm), Terms = 3:4)
L <- matrix(c(0, 0, 1, 0, 0, 0, 0, 1), nrow = 2, byrow = TRUE)
wald.test(b = coef(fm), varb = vcov(fm), L = L)



