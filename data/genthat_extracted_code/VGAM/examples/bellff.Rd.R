library(VGAM)


### Name: bellff
### Title: Bell Distribution Family Function
### Aliases: bellff
### Keywords: models regression

### ** Examples

bdata <- data.frame(y = rbell(1000, shape = loge(0.5, inverse = TRUE)))
bfit <- vglm(y ~ 1, bellff, data = bdata, trace = TRUE, crit = "coef")
coef(bfit, matrix = TRUE)
Coef(bfit)



