library(riskRegression)


### Name: plotEffects
### Title: Plotting time-varying effects from a risk regression model.
### Aliases: plotEffects
### Keywords: survival

### ** Examples


library(survival)
library(prodlim)
data(Melanoma)

fit.tarr <- ARR(Hist(time,status)~strata(sex),
                data=Melanoma,
                cause=1)
plotEffects(fit.tarr)

fit.tarr <- ARR(Hist(time,status)~strata(sex)+strata(invasion),
                data=Melanoma,
                cause=1,
                times=seq(800,3000,20))
plotEffects(fit.tarr,formula=~sex)
plotEffects(fit.tarr,formula=~invasion)
plotEffects(fit.tarr,
            formula=~invasion,
            level="invasionlevel.1")

## legend arguments are transcluded:
plotEffects(fit.tarr,
            formula=~invasion,
            legend.bty="b",
            legend.cex=1)

## and other smart arguments too:
plotEffects(fit.tarr,
	    formula=~invasion,
	    legend.bty="b",
axis2.las=2,
	    legend.cex=1)





