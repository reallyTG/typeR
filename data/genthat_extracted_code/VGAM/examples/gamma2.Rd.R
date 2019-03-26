library(VGAM)


### Name: gamma2
### Title: 2-parameter Gamma Distribution
### Aliases: gamma2
### Keywords: models regression

### ** Examples

# Essentially a 1-parameter gamma
gdata <- data.frame(y = rgamma(n = 100, shape = exp(1)))
fit1 <- vglm(y ~ 1, gamma1, data = gdata)
fit2 <- vglm(y ~ 1, gamma2, data = gdata, trace = TRUE, crit = "coef")
coef(fit2, matrix = TRUE)
c(Coef(fit2), colMeans(gdata))

# Essentially a 2-parameter gamma
gdata <- data.frame(y = rgamma(n = 500, rate = exp(-1), shape = exp(2)))
fit2 <- vglm(y ~ 1, gamma2, data = gdata, trace = TRUE, crit = "coef")
coef(fit2, matrix = TRUE)
c(Coef(fit2), colMeans(gdata))
summary(fit2)



