library(discfrail)


### Name: plot.survfit_npdf
### Title: Plot Kaplan-Meier estimates of group-specific cumulative hazard
###   from a nonparametric discrete frailty model
### Aliases: plot.survfit_npdf

### ** Examples

 x = npdf_cox( Surv(time, status) ~ x, groups=family, data=weibdata2030, K = 2,
                estK=FALSE, eps_conv=10^-4)
object = survfit_npdf( x )
plot( object )




