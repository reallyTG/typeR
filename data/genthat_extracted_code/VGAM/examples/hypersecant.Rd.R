library(VGAM)


### Name: hypersecant
### Title: Hyperbolic Secant Distribution Family Function
### Aliases: hypersecant hypersecant01 nef.hs
### Keywords: models regression

### ** Examples

hdata <- data.frame(x2 = rnorm(nn <- 200))
hdata <- transform(hdata, y = rnorm(nn))  # Not very good data!
fit1 <- vglm(y ~ x2, hypersecant, data = hdata, trace = TRUE, crit = "coef")
coef(fit1, matrix = TRUE)
fit1@misc$earg

# Not recommended:
fit2 <- vglm(y ~ x2, hypersecant(link = "identitylink"), data = hdata, trace = TRUE)
coef(fit2, matrix = TRUE)
fit2@misc$earg



