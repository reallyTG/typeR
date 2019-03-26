library(denstrip)


### Name: densregion.survfit
### Title: Density regions for survival curves
### Aliases: densregion.survfit
### Keywords: aplot survival

### ** Examples

if (requireNamespace("survival", quietly=TRUE)){

library(survival)
fit <- survfit(Surv(time, status) ~ 1, data=aml, conf.type="log-log")
plot(fit, col=0)
densregion(fit)
lines(fit, lwd=3, conf.int=FALSE, lty=1)
lines(fit, lwd=3, conf.int=TRUE, lty=2)
## Don't show: 
plot(fit, col=0); densregion(fit, ny=40)
plot(fit, col=0); densregion(fit, pointwise=TRUE)
plot(fit, col=0); densregion(fit, nlevels=10)
plot(fit, col=0); densregion(fit, colmax="purple", new=FALSE)
plot(fit, col=0); densregion(fit, scale=0.6)
## End(Don't show)
## Wider CIs based on log survival
fit <- survfit(Surv(time, status) ~ 1, data=aml, conf.type="log")
plot(fit, col=0) 
densregion(fit) # Big variation in maximum density 
plot(fit, col=0) 
densregion(fit, pointwise=TRUE, colmax="maroon4")
par(new=TRUE)
plot(fit)

## Narrower CIs based on untransformed survival.
## Normal assumption probably unrealistic
fit <- survfit(Surv(time, status) ~ 1, data=aml, conf.type="plain")
plot(fit, col=0) 
densregion(fit, pointwise=TRUE, colmax="darkmagenta")
par(new=TRUE)
plot(fit)

## Multiple survival curves on same axes
## Should overlap smoothly on devices that allow transparency
fit2 <- survfit(Surv(time, status) ~ x, data=aml, conf.type="log-log")
fit2x1 <- survfit(Surv(time, status) ~ 1, data=aml,
                  conf.type="log-log", subset=(x=="Maintained"))
fit2x0 <- survfit(Surv(time, status) ~ 1, data=aml,
                  conf.type="log-log", subset=(x=="Nonmaintained"))
plot(fit2, lwd=3, xlab="Weeks", ylab="Survival", xlim=c(0, 60),
     lty=1:2, col=c("red", "blue"), conf.int=TRUE, mark.time=TRUE)
densregion(fit2x1, colmax="red", gamma=2)
densregion(fit2x0, colmax="blue", gamma=2)

}




