library(VGAM)


### Name: gammaR
### Title: 2-parameter Gamma Distribution
### Aliases: gammaR
### Keywords: models regression

### ** Examples

# Essentially a 1-parameter gamma
gdata <- data.frame(y1 = rgamma(n <- 100, shape =  exp(1)))
fit1 <- vglm(y1 ~ 1, gamma1, data = gdata, trace = TRUE)
fit2 <- vglm(y1 ~ 1, gammaR, data = gdata, trace = TRUE, crit = "coef")
coef(fit2, matrix = TRUE)
Coef(fit2)

# Essentially a 2-parameter gamma
gdata <- data.frame(y2 = rgamma(n = 500, rate = exp(1), shape = exp(2)))
fit2 <- vglm(y2 ~ 1, gammaR, data = gdata, trace = TRUE, crit = "coef")
coef(fit2, matrix = TRUE)
Coef(fit2)
summary(fit2)



