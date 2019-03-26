library(VGAM)


### Name: genpoisson
### Title: Generalized Poisson distribution
### Aliases: genpoisson
### Keywords: models regression

### ** Examples

gdata <- data.frame(x2 = runif(nn <- 200))
gdata <- transform(gdata, y1 = rpois(nn, exp(2 - x2)))  # Poisson data
fit <- vglm(y1 ~ x2, genpoisson, data = gdata, trace = TRUE)
coef(fit, matrix = TRUE)
summary(fit)



