library(VGAM)


### Name: zageometric
### Title: Zero-Altered Geometric Distribution
### Aliases: zageometric zageometricff
### Keywords: models regression

### ** Examples

zdata <- data.frame(x2 = runif(nn <- 1000))
zdata <- transform(zdata, pobs0 = logit(-1 + 2*x2, inverse = TRUE),
                          prob  = logit(-2 + 3*x2, inverse = TRUE))
zdata <- transform(zdata, y1 = rzageom(nn, prob = prob, pobs0 = pobs0),
                          y2 = rzageom(nn, prob = prob, pobs0 = pobs0))
with(zdata, table(y1))

fit <- vglm(cbind(y1, y2) ~ x2, zageometric, data = zdata, trace = TRUE)
coef(fit, matrix = TRUE)
head(fitted(fit))
head(predict(fit))
summary(fit)



