library(denstrip)


### Name: denstrip.legend
### Title: Add a legend to a density strip or shaded region
### Aliases: denstrip.legend panel.denstrip.legend
### Keywords: aplot color

### ** Examples


if (requireNamespace("survival", quietly=TRUE)){

library(survival)
fit <- survfit(Surv(time, status) ~ 1, data=aml, conf.type="log-log")
plot(fit, col=0)
densregion(fit)
denstrip.legend(100, 0.8)

    ### TODO if max not supplied - ticks are not meaningful.
    ### In help example, find actual max dens used for densregion

denstrip.legend(120, 0.8, width=3, len=0.4, value.adj=5)
denstrip.legend(40, 0.9, horiz=TRUE)
denstrip.legend(60, 0.7, horiz=TRUE, width=0.02, len=50, value.adj=0.04)
## Don't show: 
denstrip.legend(40, 0.9, horiz=TRUE, colmax="darkmagenta")
denstrip.legend(60, 0.4, horiz=TRUE, colmax="darkmagenta", max=2)
## End(Don't show)

}






