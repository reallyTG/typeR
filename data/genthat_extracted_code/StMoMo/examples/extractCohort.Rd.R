library(StMoMo)


### Name: extractCohort
### Title: Extract cohort from an age-period array
### Aliases: extractCohort

### ** Examples

LCfit <- fit(lc(), data = EWMaleData, ages.fit = 55:89)
#Plot forecast mortality rates for the 1950 cohort
LCfor <- forecast(LCfit)
plot(55:61, extractCohort(fitted(LCfit, type = "rates"), cohort = 1950), 
     type = "l", log = "y", xlab = "age", ylab = "Mortality rate", 
     main = "Mortality rates for the 1950 cohort", 
     xlim = c(55,89), ylim = c(0.005, 0.12))
lines(62:89, extractCohort(LCfor$rates, cohort = 1950), lty = 2, col = "blue")


#Plot 10 simulated sets of mortality rates for the cohort 
# aged 60 in year 2010 (i.e., the 1950 cohort)
LCsim <- simulate(LCfit, nsim = 10)
mSim <- extractCohort(LCsim$rates, age = 60, period = 2010)
plot(55:61, extractCohort(fitted(LCfit, type = "rates"), cohort = 1950), 
     type = "l", log = "y", xlab = "age", ylab = "Mortality rate", 
     main = "Mortality rates for the 1950 cohort", 
     xlim = c(55,89), ylim = c(0.005, 0.12))
matlines(62:89, mSim, lty = 2)




