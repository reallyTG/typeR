library(VGAM)


### Name: fisk
### Title: Fisk Distribution family function
### Aliases: fisk
### Keywords: models regression

### ** Examples

fdata <- data.frame(y = rfisk(n = 200, shape = exp(1), scale = exp(2)))
fit <- vglm(y ~ 1, fisk(lss = FALSE), data = fdata, trace = TRUE)
fit <- vglm(y ~ 1, fisk(ishape1.a = exp(2)), data = fdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



