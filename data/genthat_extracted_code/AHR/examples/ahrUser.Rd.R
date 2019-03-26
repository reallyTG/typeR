library(AHR)


### Name: ahrUser
### Title: ahrUser
### Aliases: ahrUser

### ** Examples

## User supplied survival function estimator (should be exactly the same as
T <- c(rexp(100, 1), rexp(100, 2))
C <- c(rexp(100, 1), rexp(100, 2))
time <- pmin(T, C)
status <- T <= C
trt <- rep(c(0,1), c(100, 100)) # treatment indicator

sfit <- function(times, data, param) {
  fit <- survfit(Surv(Y, D) ~ 1, data=data)
  f <- approxfun(fit$time, fit$surv, method="constant", f=0, yleft=1, rule=2)
  fv <- approxfun(fit$time, fit$std.err^2, method="constant", f=0, yleft=1, rule=2)

  S <- f(times)
  logV <- fv(times) * nrow(data)
  V <- S^2 * logV

  list(times=times, S=S, V=V, logV=logV)
}
fit1 <- ahrUser(2, Surv(time, status) ~ trt,
                data.frame(time=time, status=status, trt=trt), user.survfit=sfit, user.param=list())
fit1
fit2 <- ahrKM(2, Surv(time, status) ~ trt, data.frame(time=time, status=status, trt=trt), cov=FALSE)
fit2




