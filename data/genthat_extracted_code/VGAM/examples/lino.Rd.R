library(VGAM)


### Name: lino
### Title: Generalized Beta Distribution Family Function
### Aliases: lino
### Keywords: models regression

### ** Examples

ldata <- data.frame(y1 = rbeta(n = 1000, exp(0.5), exp(1)))  # ~ standard beta
fit <- vglm(y1 ~ 1, lino, data = ldata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
head(fitted(fit))
summary(fit)

# Nonstandard beta distribution
ldata <- transform(ldata, y2 = rlino(n = 1000, shape1 = exp(1),
                                     shape2 = exp(2), lambda = exp(1)))
fit2 <- vglm(y2 ~ 1, lino(lshape1 = "identitylink", lshape2 = "identitylink",
             ilamb = 10), data = ldata, trace = TRUE)
coef(fit2, matrix = TRUE)



