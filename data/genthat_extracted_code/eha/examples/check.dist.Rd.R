library(eha)


### Name: check.dist
### Title: Graphical goodness-of-fit test
### Aliases: check.dist
### Keywords: distribution

### ** Examples


data(mort)
oldpar <- par(mfrow = c(2, 2))
fit.cr <- coxreg(Surv(enter, exit, event) ~ ses, data = mort)
fit.w <- phreg(Surv(enter, exit, event) ~ ses, data = mort)
fit.g <- phreg(Surv(enter, exit, event) ~ ses, data = mort,
dist = "gompertz")
fit.pch <- phreg(Surv(enter, exit, event) ~ ses, data = mort,
dist = "pch", cuts = c(5, 10, 15))
fit.ev <- phreg(Surv(enter, exit, event) ~ ses, data = mort,
dist = "ev")
check.dist(fit.cr, fit.w)
check.dist(fit.cr, fit.g)
check.dist(fit.cr, fit.pch)
check.dist(fit.cr, fit.ev)
par(oldpar)




