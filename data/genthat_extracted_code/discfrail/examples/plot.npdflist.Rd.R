library(discfrail)


### Name: plot.npdflist
### Title: Survival or cumulative hazard curves from a nonparametric
###   discrete frailty model chosen by automatic model selection
### Aliases: plot.npdflist

### ** Examples

result = npdf_cox( Surv(time, status) ~ x, groups = family, data = weibdata2030,
                   K = 2, eps_conv=10^-4)
plot( result, K = 2 )
plot( result, type = "na" )
plot( result, type = "na", cols=ifelse(result$belonging==2, "purple", "black"),
     na_opts = list(xlim=c(0,200), ylim=c(0,2),
                    xlab="Follow-up days",
                    ylab="Nelson-Aalen estimate"))




