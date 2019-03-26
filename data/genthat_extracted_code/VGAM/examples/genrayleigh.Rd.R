library(VGAM)


### Name: genrayleigh
### Title: Generalized Rayleigh Distribution Family Function
### Aliases: genrayleigh
### Keywords: models regression

### ** Examples

Scale <- exp(1); shape <- exp(1)
rdata <- data.frame(y = rgenray(n = 1000, scale = Scale, shape = shape))
fit <- vglm(y ~ 1, genrayleigh, data = rdata, trace = TRUE)
c(with(rdata, mean(y)), head(fitted(fit), 1))
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



