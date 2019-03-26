library(stdReg)


### Name: stdGlm
### Title: Regression standardization in generalized linear models
### Aliases: stdGlm

### ** Examples


##Example 1: continuous outcome
n <- 1000
Z <- rnorm(n)
X <- rnorm(n, mean=Z)
Y <- rnorm(n, mean=X+Z+0.1*X^2)
dd <- data.frame(Z, X, Y)
fit <- glm(formula=Y~X+Z+I(X^2), data=dd)
fit.std <- stdGlm(fit=fit, data=dd, X="X", x=seq(-3,3,0.5))
print(summary(fit.std))
plot(fit.std)

##Example 2: binary outcome
n <- 1000
Z <- rnorm(n)
X <- rnorm(n, mean=Z)
Y <- rbinom(n, 1, prob=(1+exp(X+Z))^(-1))
dd <- data.frame(Z, X, Y)
fit <- glm(formula=Y~X+Z+X*Z, family="binomial", data=dd)
fit.std <- stdGlm(fit=fit, data=dd, X="X", x=seq(-3,3,0.5))
print(summary(fit.std))
plot(fit.std)



