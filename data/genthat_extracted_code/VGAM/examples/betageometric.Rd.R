library(VGAM)


### Name: betageometric
### Title: Beta-geometric Distribution Family Function
### Aliases: betageometric
### Keywords: models regression

### ** Examples

bdata <- data.frame(y = 0:11, wts = c(227,123,72,42,21,31,11,14,6,4,7,28))
fitb <- vglm(y ~ 1, betageometric, data = bdata, weight = wts, trace = TRUE)
fitg <- vglm(y ~ 1,     geometric, data = bdata, weight = wts, trace = TRUE)
coef(fitb, matrix = TRUE)
Coef(fitb)
sqrt(diag(vcov(fitb, untransform = TRUE)))
fitb@misc$shape1
fitb@misc$shape2
# Very strong evidence of a beta-geometric:
pchisq(2 * (logLik(fitb) - logLik(fitg)), df = 1, lower.tail = FALSE)



