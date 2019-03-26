library(NSM3)


### Name: mblm
### Title: Fitting Median-Based Linear Models (from 'mblm' oackage)
### Aliases: mblm
### Keywords: mblm

### ** Examples

set.seed(1234)
x <- 1:100+rnorm(100)
y <- x+rnorm(100)
y[100] <- 200
fit <- mblm(y~x)
fit
summary(fit)
fit2 <- lm(y~x)
plot(x,y)
abline(fit)
abline(fit2,lty=2)
plot(fit)
residuals(fit)
fitted(fit)
plot(density(fit$slopes))
plot(density(fit$intercepts))
anova(fit)
anova(fit2)
anova(fit,fit2)
confint(fit)
AIC(fit,fit2)



