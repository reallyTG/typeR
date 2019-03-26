library(missDeaths)


### Name: md.survcox
### Title: Fit a proportional hazards regression model over disease
###   recurrence data with missing information of possible deaths
### Aliases: md.survcox

### ** Examples


## Not run: 
##D library(missDeaths)
##D data(slopop)
##D 
##D data(observed)
##D observed$time = observed$time*365.2425
##D D = md.D(age=observed$age*365.2425, sex=observed$sex, year=(observed$year - 1960)*365.2425)
##D 
##D #fit a cox model (NOTE: estimated std error is slightly underestimated!)
##D md.survcox(observed, Surv(time, status) ~ age + sex + iq + elevation, 
##D   observed$maxtime*365.2425, D, slopop, iterations=4, R=1)
##D 
##D #multiple imputations to correct the stimated std error
##D md.survcox(observed, Surv(time, status) ~ age + sex + iq + elevation, 
##D   observed$maxtime*365.2425, D, slopop, iterations=4, R=50)
## End(Not run)




