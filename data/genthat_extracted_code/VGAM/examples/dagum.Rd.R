library(VGAM)


### Name: dagum
### Title: Dagum Distribution Family Function
### Aliases: dagum
### Keywords: models regression

### ** Examples

ddata <- data.frame(y = rdagum(n = 3000, scale = exp(2),
                               shape1 = exp(1), shape2 = exp(1)))
fit <- vglm(y ~ 1, dagum(lss = FALSE), data = ddata, trace = TRUE)
fit <- vglm(y ~ 1, dagum(lss = FALSE, ishape1.a = exp(1)),
            data = ddata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



