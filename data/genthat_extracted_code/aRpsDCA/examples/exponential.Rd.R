library(aRpsDCA)


### Name: exponential
### Title: Arps exponential declines
### Aliases: exponential exponential.q exponential.Np

### ** Examples

## qi = 1000 Mscf/d, Di = 95% effective / year, t from 0 to 25 days
exponential.q(1000, as.nominal(0.95, from.period="year", to.period="day"), seq(0, 25))

## qi = 500 bopd, Di = 3.91 nominal / year, t = 5 years
exponential.Np(rescale.by.time(500, from.period="day", to.period="year"), 3.91, 5)



