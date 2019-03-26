library(VGAM)


### Name: acat
### Title: Ordinal Regression with Adjacent Categories Probabilities
### Aliases: acat
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
(fit <- vglm(cbind(normal, mild, severe) ~ let, acat, data = pneumo))
coef(fit, matrix = TRUE)
constraints(fit)
model.matrix(fit)



