
library("mlt")
library("survival")
library("flexsurv")

chk <- function(x, y, ...) {

    ret <- all.equal(x, y, ...)
    if (isTRUE(ret)) return(ret)
    print(ret)
    return(TRUE)
}
tol <- .001

### right-censored veteran data
### exponential model
fit1 <- coxph(Surv(time, status) ~ karno + age + trt, veteran)
fit2 <- survreg(Surv(time, status) ~ karno + age + trt, veteran, dist = "exponential")
fit3 <- flexsurvreg(Surv(time, status) ~ karno + age + trt, data= veteran, dist = "exponential")

veteran$ytime <- with(veteran, Surv(time, status))
dy <- numeric_var("ytime", support = c(0.1, 1000))
by <- log_basis(dy, ui = "increasing")
m <- mlt(ctm(by, shift = ~ karno + age + trt, data = veteran, todistr = "MinExtr"),
         data = veteran, fixed = c("log(ytime)" = 1))

stopifnot(chk(fit3$logliki, m$logliki(coef(m)[-2], weights(m)), 
                    tol = tol, check.attributes = FALSE))

stopifnot(chk(logLik(fit2), logLik(m), tol = tol))
stopifnot(chk(logLik(fit3), logLik(m), tol = tol, 
              check.attributes = FALSE))

### Weibull model
fit2 <- survreg(Surv(time, status) ~ karno + age + trt, veteran, dist = "weibull")
fit3 <- flexsurvreg(Surv(time, status) ~ karno + age + trt, data= veteran, dist = "weibull")

veteran$ytime <- with(veteran, Surv(time, status))
dy <- numeric_var("ytime", support = c(0.1, 1000))
# by <- Bernstein_basis(dy, order = 10, ui = "increasing")
by <- log_basis(dy, ui = "increasing")
m <- mlt(ctm(by, shift = ~ karno + age + trt, data = veteran, todistr = "MinExtr"),
         data = veteran)

stopifnot(chk(fit3$logliki, m$logliki(coef(m), weights(m)), 
              tol = tol, check.attributes = FALSE))

stopifnot(chk(logLik(fit2), logLik(m), tol = tol))
stopifnot(chk(logLik(fit3), logLik(m), tol = tol,
              check.attributes = FALSE))

### now with time-dependent covariates
vet2 <- survSplit(Surv(time, status) ~., veteran,
                  cut=c(60, 120), episode ="timegroup")
vet2$timegroup <- factor(vet2$timegroup)
vet2$ytime <- with(vet2, Surv(tstart, time, status))

## exponential model
fit3 <- flexsurvreg(Surv(tstart, time, status) ~ karno + karno:timegroup +
                     age + trt, data= vet2, dist = "exponential")
m <- mlt(ctm(by, shift = ~ karno + karno:timegroup + age + trt, data = vet2, todistr = "MinExtr"),
         data = vet2, fixed = c("log(ytime)" = 1))

stopifnot(chk(fit3$logliki, m$logliki(coef(m)[-2], weights(m)), 
              tol = tol, check.attributes = FALSE))
stopifnot(chk(logLik(fit3), logLik(m), tol = tol, check.attributes = FALSE))

### Weibull model
fit3 <- flexsurvreg(Surv(tstart, time, status) ~ karno + karno:timegroup +
                     age + trt, data= vet2, dist = "weibull")
m <- mlt(ctm(by, shift = ~ karno + karno:timegroup + age + trt, data = vet2, todistr = "MinExtr"),
         data = vet2, scale = TRUE)

stopifnot(chk(fit3$logliki, m$logliki(coef(m), weights(m)), 
              tol = tol, check.attributes = FALSE))
stopifnot(chk(logLik(fit3), logLik(m), tol = tol, check.attributes = FALSE))

## Cox model, see ?survival::survSplit
fit1 <- coxph(Surv(tstart, time, status) ~ karno + karno:strata(timegroup) +
              age + trt, data= vet2)

### refit this model using mlt
btg <- as.basis(vet2$timegroup)
by <- Bernstein_basis(dy, order = 3, ui = "increasing")
m <- mlt(ctm(by, interacting = btg, 
         shift = ~ karno + karno:timegroup + age + trt, data = vet2, todistr = "MinExtr"),
         data = vet2, scale = TRUE)

max(abs(coef(fit1) - coef(m)[-(1:12)]))
max(abs(diag(vcov(m))[-(1:12)] - diag(vcov(fit1))))
