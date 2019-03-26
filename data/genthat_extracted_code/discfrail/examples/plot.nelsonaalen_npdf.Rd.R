library(discfrail)


### Name: plot.nelsonaalen_npdf
### Title: Plot Nelson-Aalen estimates of group-specific cumulative hazard
###   from a nonparametric discrete frailty model
### Aliases: plot.nelsonaalen_npdf

### ** Examples


 x = npdf_cox( Surv(time, status) ~ x, groups=family, data=weibdata2030, K = 2,
                estK=FALSE, eps_conv=10^-4)
object = nelsonaalen_npdf( x )
plot( object )
plot( object, xlim=c(0,200), ylim=c(0,2),
     xlab="Follow-up days", ylab="Nelson-Aalen estimate",
     cols=ifelse(x$belonging==2, "purple", "black"))




