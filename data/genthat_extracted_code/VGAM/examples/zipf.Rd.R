library(VGAM)


### Name: zipf
### Title: Zipf Distribution Family Function
### Aliases: zipf
### Keywords: models regression

### ** Examples

zdata <- data.frame(y = 1:5, ofreq = c(63, 14, 5, 1, 2))
zfit <- vglm(y ~ 1, zipf, data = zdata, trace = TRUE, weight = ofreq)
zfit <- vglm(y ~ 1, zipf(lshape = "identitylink", ishape = 3.4), data = zdata,
            trace = TRUE, weight = ofreq, crit = "coef")
zfit@misc$N
(shape.hat <- Coef(zfit))
with(zdata, weighted.mean(y, ofreq))
fitted(zfit, matrix = FALSE)



