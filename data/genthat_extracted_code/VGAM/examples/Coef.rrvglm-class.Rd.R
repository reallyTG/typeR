library(VGAM)


### Name: Coef.rrvglm-class
### Title: Class "Coef.rrvglm"
### Aliases: Coef.rrvglm-class
### Keywords: classes

### ** Examples

# Rank-1 stereotype model of Anderson (1984)
pneumo <- transform(pneumo, let = log(exposure.time), x3 = runif(nrow(pneumo)))
fit <- rrvglm(cbind(normal, mild, severe) ~ let + x3, multinomial, data = pneumo)
coef(fit, matrix = TRUE)
Coef(fit)
# print(Coef(fit), digits = 3)



