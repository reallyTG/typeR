library(bamp)


### Name: apcSimulate
### Title: Simulate from age-period-cohort model
### Aliases: apcSimulate

### ** Examples

age=sqrt(seq(5,0,length=10)); age<-1-age-mean(age)
period=15:1; period[8:15]<-8:15; period<-period/6; period<-period-mean(period)
periods_per_agegroup=5; number_of_cohorts <- periods_per_agegroup*(10-1)+15
cohort<-rep(0,60); cohort[1:10]<-10:1; cohort[41:60]<- -(1:20)/2; cohort<-cohort/10;
cohort<-cohort-mean(cohort)
simdata<-apcSimulate(-5, age, period, cohort, periods_per_agegroup, 1e6)
par(mfrow=c(3,1))
plot(age, type="l")
plot(period, type="l")
plot(cohort, type="l")
## Not run: 
##D simmod <- bamp(cases = simdata$cases, population = simdata$population, age = "rw1", 
##D period = "rw1", cohort = "rw1", periods_per_agegroup =periods_per_agegroup)
##D plot(simmod)
## End(Not run)



