library(coxinterval)


### Name: jump2step
### Title: Accumulate increments in values from a step function of time
### Aliases: jump2step
### Keywords: survival

### ** Examples

fit <- coxdual(Surv(start, stop, status) ~ cluster(id)
               + trans(from, to) + z, data = dualrc, init.coxph = TRUE)
haz <- step2jump(fit$coxph$basehaz, stratum = 3)
Haz <- jump2step(haz, stratum = 3)
all(Haz == fit$coxph$basehaz)



