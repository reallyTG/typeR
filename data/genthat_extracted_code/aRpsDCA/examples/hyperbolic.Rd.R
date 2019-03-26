library(aRpsDCA)


### Name: hyperbolic
### Title: Arps hyperbolic declines
### Aliases: hyperbolic hyperbolic.q hyperbolic.Np hyperbolic.D

### ** Examples

## qi = 1000 Mscf/d, Di = 95% effective / year, b = 1.2, t from 0 to 25 days
hyperbolic.q(1000, as.nominal(0.95, from.period="year", to.period="day"),
    1.2, seq(0, 25))

## qi = 500 bopd, Di = 3.91 nominal / year, b = 0.5, t = 5 years
hyperbolic.Np(rescale.by.time(500, from.period="day", to.period="year"),
    3.91, 0.5, 5)

## Di = 85% effective / year, b = 1.5, t = 6 months
hyperbolic.D(as.nominal(0.85), 1.5, 0.5)



