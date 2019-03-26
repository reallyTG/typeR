library(flexsurv)


### Name: flexsurvreg
### Title: Flexible parametric regression for time-to-event data
### Aliases: flexsurv.dists flexsurvreg
### Keywords: models survival

### ** Examples


data(ovarian)
## Compare generalized gamma fit with Weibull
fitg <- flexsurvreg(formula = Surv(futime, fustat) ~ 1, data = ovarian, dist="gengamma")
fitg
fitw <- flexsurvreg(formula = Surv(futime, fustat) ~ 1, data = ovarian, dist="weibull")
fitw
plot(fitg)
lines(fitw, col="blue", lwd.ci=1, lty.ci=1)
## Identical AIC, probably not enough data in this simple example for a
## very flexible model to be worthwhile.

## Custom distribution
## make "dEV" and "pEV" from eha package (if installed)
##   available to the working environment
if (require("eha")) {
custom.ev <- list(name="EV",
                      pars=c("shape","scale"),
                      location="scale",
                      transforms=c(log, log),
                      inv.transforms=c(exp, exp),
                      inits=function(t){ c(1, median(t)) })
fitev <- flexsurvreg(formula = Surv(futime, fustat) ~ 1, data = ovarian,
                    dist=custom.ev)
fitev
lines(fitev, col="purple", col.ci="purple")
}


## Custom distribution: supply the hazard function only
hexp2 <- function(x, rate=1){ rate } # exponential distribution
hexp2 <- Vectorize(hexp2)
custom.exp2 <- list(name="exp2", pars=c("rate"), location="rate",
                    transforms=c(log), inv.transforms=c(exp),
                    inits=function(t)1/mean(t))
flexsurvreg(Surv(futime, fustat) ~ 1, data = ovarian, dist=custom.exp2)
flexsurvreg(Surv(futime, fustat) ~ 1, data = ovarian, dist="exp")
## should give same answer




