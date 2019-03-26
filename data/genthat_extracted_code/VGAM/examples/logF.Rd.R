library(VGAM)


### Name: logF
### Title: Natural Exponential Family Generalized Hyperbolic Secant
###   Distribution Family Function
### Aliases: logF
### Keywords: models regression

### ** Examples

nn <- 1000
ldata <- data.frame(y1 = rnorm(nn, m = +1, sd = exp(2)),  # Not proper data
                    x2 = rnorm(nn, m = -1, sd = exp(2)),
                    y2 = rnorm(nn, m = -1, sd = exp(2)))  # Not proper data
fit1 <- vglm(y1 ~ 1 , logF, data = ldata, trace = TRUE)
fit2 <- vglm(y2 ~ x2, logF, data = ldata, trace = TRUE)
coef(fit2, matrix = TRUE)
summary(fit2)
vcov(fit2)

head(fitted(fit1))
with(ldata, mean(y1))
max(abs(head(fitted(fit1)) - with(ldata, mean(y1))))



