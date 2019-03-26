library(VGAM)


### Name: vonmises
### Title: von Mises Distribution Family Function
### Aliases: vonmises
### Keywords: models regression

### ** Examples

vdata <- data.frame(x2 = runif(nn <- 1000))
vdata <- transform(vdata, y = rnorm(nn, m = 2+x2, sd = exp(0.2)))  # Bad data!!
fit <- vglm(y  ~ x2, vonmises(zero = 2), data = vdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
with(vdata, range(y))  # Original data
range(depvar(fit))     # Processed data is in [0,2*pi)



