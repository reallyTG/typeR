library(missDeaths)


### Name: md.survnp
### Title: Nonparametric analysis of disease recurrence with missing
###   information of possible deaths
### Aliases: md.survnp

### ** Examples


## Not run: 
##D library(missDeaths)
##D library(cmprsk)
##D data(slopop)
##D 
##D data(observed)
##D D = md.D(age=observed$age*365.2425, sex=observed$sex, year=(observed$year - 1960)*365.2425)
##D np = md.survnp(observed$time*365.2425, observed$status, observed$maxtime*365.2425, D, slopop)
##D 
##D #calculate net survival at 3 and 9 years
##D w = list(list(time=np$time, est=np$surv.net, var=(np$std.err.net)^2))
##D timepoints(w, times=c(3,9)*365.2425)
##D 
##D #plot the net and event free survival curves
##D plot(np$time, np$surv.net)
##D plot(np$time, np$surv.efs)
## End(Not run)




