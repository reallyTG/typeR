library(missDeaths)


### Name: missDeaths
### Title: Simulating and analyzing time to event data in the presence of
###   population mortality
### Aliases: missDeaths missDeaths-package

### ** Examples

## Not run: 
##D library(missDeaths)
##D ratetable = survexp.us
##D 
##D sim = md.simparams() +
##D           md.sex("sex", 0.5) + 
##D           md.binom("Z1", 0.5) +
##D           md.mvnorm(c("Z2", "Z3"), c(100, 0), matrix(c(225, 3, 2, 1), 2, 2)) +
##D           md.sample("Z4", c(1, 2, 3, 4), c(0.25, 0.25, 0.25, 0.25)) +
##D           md.uniform("birth", as.Date("1925-1-1"), as.Date("1950-1-1")) +
##D           md.uniform("start", as.Date("2000-1-1"), as.Date("2005-1-1")) +
##D           md.death("death", ratetable, "sex", "birth", "start") +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE) + 
##D           md.exp("event", "start", c("age", "sex", "Z1", "Z2"), 
##D              c(0.1, 2, 1, 0.01), 0.05/365.2425)
##D data = md.simulate(sim, 1000)
##D           
##D #construct a complete right censored data set
##D complete = md.censor(data, "start", as.Date("2010-1-1"), c("event", "death"))
##D 
##D #construct an observed right censored data set with non-reported deaths
##D observed = complete
##D observed$time[which(complete$status == 2)] = observed$maxtime[which(complete$status == 2)]
##D observed$status[which(complete$status == 2)] = 0
##D 
##D #estimate coefficients of the proportional hazards model
##D D = md.D(age=observed$age, sex=observed$sex, year=observed$start)
##D md.survcox(observed, Surv(time, status) ~ age + sex + Z1 + Z2, 
##D           observed$maxtime, D, ratetable, iterations=4, R=50)
##D           
##D #estimate net- and event-free survival
##D np = md.survnp(observed$time, observed$status, observed$maxtime, D, ratetable)
##D w = list(list(time=np$time, est=np$surv.net, var=(np$std.err.net)^2))
##D timepoints(w, times=c(3,9)*365.2425)
##D plot(np$time/365.2425, np$surv.net)
##D plot(np$time/365.2425, np$surv.efs)
## End(Not run)



