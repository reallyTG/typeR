library(car)


### Name: Boot
### Title: Bootstrapping for regression models
### Aliases: Boot Boot.default Boot.lm Boot.glm Boot.nls
### Keywords: regression

### ** Examples

m1 <- lm(Fertility ~ ., swiss)
betahat.boot <- Boot(m1, R=199) # 199 bootstrap samples--too small to be useful
summary(betahat.boot)  # default summary
confint(betahat.boot)
hist(betahat.boot)
# Bootstrap for the estimated residual standard deviation:
sigmahat.boot <- Boot(m1, R=199, f=sigmaHat, labels="sigmaHat")
summary(sigmahat.boot)
confint(sigmahat.boot)



