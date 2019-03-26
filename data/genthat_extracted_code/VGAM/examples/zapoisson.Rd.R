library(VGAM)


### Name: zapoisson
### Title: Zero-Altered Poisson Distribution
### Aliases: zapoisson zapoissonff
### Keywords: models regression

### ** Examples

zdata <- data.frame(x2 = runif(nn <- 1000))
zdata <- transform(zdata, pobs0  = logit( -1 + 1*x2, inverse = TRUE),
                          lambda = loge(-0.5 + 2*x2, inverse = TRUE))
zdata <- transform(zdata, y = rzapois(nn, lambda, pobs0 = pobs0))

with(zdata, table(y))
fit <- vglm(y ~ x2, zapoisson, data = zdata, trace = TRUE)
fit <- vglm(y ~ x2, zapoisson, data = zdata, trace = TRUE, crit = "coef")
head(fitted(fit))
head(predict(fit))
head(predict(fit, untransform = TRUE))
coef(fit, matrix = TRUE)
summary(fit)

# Another example ------------------------------
# Data from Angers and Biswas (2003)
abdata <- data.frame(y = 0:7, w = c(182, 41, 12, 2, 2, 0, 0, 1))
abdata <- subset(abdata, w > 0)
Abdata <- data.frame(yy = with(abdata, rep(y, w)))
fit3 <- vglm(yy ~ 1, zapoisson, data = Abdata, trace = TRUE, crit = "coef")
coef(fit3, matrix = TRUE)
Coef(fit3)  # Estimate lambda (they get 0.6997 with SE 0.1520)
head(fitted(fit3), 1)
with(Abdata, mean(yy))  # Compare this with fitted(fit3)



