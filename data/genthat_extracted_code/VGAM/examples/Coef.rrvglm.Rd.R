library(VGAM)


### Name: Coef.rrvglm
### Title: Returns Important Matrices etc. of a RR-VGLM Object
### Aliases: Coef.rrvglm
### Keywords: models regression

### ** Examples

# Rank-1 stereotype model of Anderson (1984)
pneumo <- transform(pneumo, let = log(exposure.time), x3 = runif(nrow(pneumo)))
fit <- rrvglm(cbind(normal, mild, severe) ~ let + x3, multinomial, data = pneumo)
coef(fit, matrix = TRUE)
Coef(fit)



