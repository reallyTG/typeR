library(Mqrcm)


### Name: Mqrcm-package
### Title: M-Quantile Regression Coefficients Modeling
### Aliases: Mqrcm-package
### Keywords: package

### ** Examples


# use simulated data

n <- 250
x <- rexp(n)
y <- runif(n, 0, 1 + x)
model <- iMqr(y ~ x, formula.p = ~ p + I(p^2))
summary(model)
summary(model, p = c(0.1,0.2,0.3))
predict(model, type = "beta", p = c(0.1,0.2,0.3))
predict(model, type = "CDF", newdata = data.frame(x = c(1,2,3), y = c(0.5,1,2)))
predict(model, type = "QF", p = c(0.1,0.2,0.3), newdata = data.frame(x = c(1,2,3)))
predict(model, type = "sim", newdata = data.frame(x = c(1,2,3)))
par(mfrow = c(1,2)); plot(model, ask = FALSE)



