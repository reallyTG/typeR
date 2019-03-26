library(VGAM)


### Name: lomax
### Title: Lomax Distribution Family Function
### Aliases: lomax
### Keywords: models regression

### ** Examples

ldata <- data.frame(y = rlomax(n = 1000, scale =  exp(1), exp(2)))
fit <- vglm(y ~ 1, lomax, data = ldata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



