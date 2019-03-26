library(coxinterval)


### Name: linapprox
### Title: Linear approximation
### Aliases: linapprox

### ** Examples

fit <- coxdual(Surv(start, stop, status) ~ cluster(id)
               + trans(from, to) + z, data = dualrc, init.coxph = TRUE)
head(basehaz)
Haz01 <- with(fit, split(basehaz[, 1:2], basehaz[, 3]))[[1]]
all(Haz01$hazard == with(Haz01, linapprox(cbind(time, hazard), time)))



