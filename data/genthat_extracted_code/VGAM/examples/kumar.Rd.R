library(VGAM)


### Name: kumar
### Title: Kumaraswamy Distribution Family Function
### Aliases: kumar
### Keywords: models regression

### ** Examples

shape1 <- exp(1); shape2 <- exp(2)
kdata <- data.frame(y = rkumar(n = 1000, shape1, shape2))
fit <- vglm(y ~ 1, kumar, data = kdata, trace = TRUE)
c(with(kdata, mean(y)), head(fitted(fit), 1))
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



