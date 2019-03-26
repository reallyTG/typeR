library(VGAM)


### Name: gengamma.stacy
### Title: Generalized Gamma distribution family function
### Aliases: gengamma.stacy
### Keywords: models regression

### ** Examples

k <- exp(-1); Scale <- exp(1); dd <- exp(0.5); set.seed(1)
gdata <- data.frame(y = rgamma(2000, shape = k, scale = Scale))
gfit <- vglm(y ~ 1, gengamma.stacy, data = gdata, trace = TRUE)
coef(gfit, matrix = TRUE)



