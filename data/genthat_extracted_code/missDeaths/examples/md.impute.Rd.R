library(missDeaths)


### Name: md.impute
### Title: Correctly impute missing information of possible deaths using
###   population mortality
### Aliases: md.impute

### ** Examples

library(missDeaths)
data(slopop)

data(observed)
observed$time = observed$time*365.2425
D = md.D(age=observed$age*365.2425, sex=observed$sex, year=(observed$year - 1960)*365.2425)
newtimes = md.impute(observed, Surv(time, status) ~ age + sex + iq + elevation, 
  observed$maxtime*365.2425, D, slopop, iterations=4)

#Cumulative incidence function
cif = survfit(Surv(observed$time, observed$status)~1)
cif$surv = 1 - cif$surv
cif$upper = 1 - cif$upper
cif$lower = 1 - cif$lower
plot(cif)

#Net survival (NOTE: std error is slightly underestimated!)
surv.net = survfit(Surv(newtimes, observed$status)~1)
summary(surv.net, times=c(3,9)*365.2425)
plot(surv.net)

#Event free survival (NOTE: std error is slightly underestimated!)
surv.efs = survfit(Surv(newtimes, 1 * (observed$status | (newtimes != observed$time)))~1)
summary(surv.efs, times=c(3,9)*365.2425)
plot(surv.efs)




