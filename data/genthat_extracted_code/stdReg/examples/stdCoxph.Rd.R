library(stdReg)


### Name: stdCoxph
### Title: Regression standardization in Cox proportional hazards models
### Aliases: stdCoxph

### ** Examples


require(survival)

n <- 1000
Z <- rnorm(n)
X <- rnorm(n, mean=Z)
T <- rexp(n, rate=exp(X+Z+X*Z)) #survival time
C <- rexp(n, rate=exp(X+Z+X*Z)) #censoring time
U <- pmin(T, C) #time at risk
D <- as.numeric(T < C) #event indicator
dd <- data.frame(Z, X, U, D)
fit <- coxph(formula=Surv(U, D)~X+Z+X*Z, data=dd, method="breslow")
fit.std <- stdCoxph(fit=fit, data=dd, X="X", x=seq(-1,1,0.5), t=1:5)
print(summary(fit.std, t=3))
plot(fit.std)




