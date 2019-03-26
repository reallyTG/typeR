library(VGAM)


### Name: powerlink
### Title: Power Link Function
### Aliases: powerlink
### Keywords: math models regression

### ** Examples

powerlink("a", power = 2, short = FALSE, tag = TRUE)
powerlink(x <- 1:5)
powerlink(x, power = 2)
max(abs(powerlink(powerlink(x, power = 2),
                  power = 2, inverse = TRUE) - x))  # Should be 0
powerlink(x <- (-5):5, power = 0.5)  # Has NAs

# 1/2 = 0.5
pdata <- data.frame(y = rbeta(n = 1000, shape1 = 2^2, shape2 = 3^2))
fit <- vglm(y ~ 1, betaR(lshape1 = powerlink(power = 0.5), i1 = 3,
                         lshape2 = powerlink(power = 0.5), i2 = 7), data = pdata)
t(coef(fit, matrix = TRUE))
Coef(fit)  # Useful for intercept-only models
vcov(fit, untransform = TRUE)



