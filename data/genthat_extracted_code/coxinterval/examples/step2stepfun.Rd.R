library(coxinterval)


### Name: step2stepfun
### Title: Step function from cumulative increments over time
### Aliases: step2stepfun
### Keywords: survival

### ** Examples

fit <- coxdual(Surv(start, stop, status) ~ cluster(id)
               + trans(from, to) + z, data = dualrc, init.coxph = TRUE)
head(fit$coxph$basehaz)
Hazfun <- step2stepfun(fit$coxph$basehaz, stratum = 3)
Haz01 <- with(fit$coxph, split(basehaz[, 1:2], basehaz[, 3]))[[1]]
all(Hazfun[[1]](Haz01$time) == Haz01$hazard)



