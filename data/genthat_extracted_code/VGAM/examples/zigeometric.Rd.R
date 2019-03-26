library(VGAM)


### Name: zigeometric
### Title: Zero-Inflated Geometric Distribution Family Function
### Aliases: zigeometric zigeometricff
### Keywords: models regression

### ** Examples

gdata <- data.frame(x2 = runif(nn <- 1000) - 0.5)
gdata <- transform(gdata, x3 = runif(nn) - 0.5,
                          x4 = runif(nn) - 0.5)
gdata <- transform(gdata, eta1 =  1.0 - 1.0 * x2 + 2.0 * x3,
                          eta2 = -1.0,
                          eta3 =  0.5)
gdata <- transform(gdata, prob1 = logit(eta1, inverse = TRUE),
                          prob2 = logit(eta2, inverse = TRUE),
                          prob3 = logit(eta3, inverse = TRUE))
gdata <- transform(gdata, y1 = rzigeom(nn, prob1, pstr0 = prob3),
                          y2 = rzigeom(nn, prob2, pstr0 = prob3),
                          y3 = rzigeom(nn, prob2, pstr0 = prob3))
with(gdata, table(y1))
with(gdata, table(y2))
with(gdata, table(y3))
head(gdata)

fit1 <- vglm(y1 ~ x2 + x3 + x4, zigeometric(zero = 1), data = gdata, trace = TRUE)
coef(fit1, matrix = TRUE)
head(fitted(fit1, type = "pstr0"))

fit2 <- vglm(cbind(y2, y3) ~ 1, zigeometric(zero = 1), data = gdata, trace = TRUE)
coef(fit2, matrix = TRUE)
summary(fit2)



