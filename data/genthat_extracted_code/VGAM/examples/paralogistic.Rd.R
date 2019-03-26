library(VGAM)


### Name: paralogistic
### Title: Paralogistic Distribution Family Function
### Aliases: paralogistic
### Keywords: models regression

### ** Examples

pdata <- data.frame(y = rparalogistic(n = 3000, exp(1), scale = exp(1)))
fit <- vglm(y ~ 1, paralogistic(lss = FALSE), data = pdata, trace = TRUE)
fit <- vglm(y ~ 1, paralogistic(ishape1.a = 2.3, iscale = 5),
            data = pdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



