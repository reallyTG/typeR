library(discfrail)


### Name: nelsonaalen_npdf
### Title: Nelson-Aalen estimates of group-specific cumulative hazard from
###   a nonparametric discrete frailty model
### Aliases: nelsonaalen_npdf

### ** Examples

x = npdf_cox( Surv(time, status) ~ x, groups=family, data=weibdata2030, K = 2,
               estK=FALSE, eps_conv=10^-4)
object = nelsonaalen_npdf( x )




