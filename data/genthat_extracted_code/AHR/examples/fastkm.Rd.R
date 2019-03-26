library(AHR)


### Name: fastkm
### Title: fastkm
### Aliases: fastkm

### ** Examples

T <- rexp(100)
C <- rexp(100)
Y <- pmin(T, C)
D <- T <= C
sort(fastkm(Y, D)$surv, decreasing=TRUE)
# should be exactly the same as
fit <- survfit(Surv(Y, D) ~ 1)
f <- approxfun(fit$time, fit$surv, f=0, rule=2, yleft=1)
f(fit$time)



