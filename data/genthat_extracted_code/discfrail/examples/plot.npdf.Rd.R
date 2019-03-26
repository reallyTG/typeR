library(discfrail)


### Name: plot.npdf
### Title: Survival or cumulative hazard curves from a fitted nonparametric
###   discrete frailty model
### Aliases: plot.npdf

### ** Examples


result = npdf_cox( Surv(time, status) ~ x, groups = family, data = weibdata2030,
                    K = 2, estK = FALSE, eps_conv=10^-4)
plot( result )
plot( result, type = "km" )
plot( result, cols = ifelse( result$belonging == 1, "purple", "black" ), xlim = c( 0, 150 ) )

## use of survfit_opts.  show only first 10 groups
plot( result, survfit_opts = list(subset = (weibdata2030$family >= 10) ))

plot( result, type = "na" )

## use of na_opts to customise the Nelson-Aalen plot
plot( result, type = "na", cols=ifelse(result$belonging==2, "purple", "black"),
     na_opts = list(xlim=c(0,200), ylim=c(0,2),
                    xlab="Follow-up days",
                    ylab="Nelson-Aalen estimate"))




