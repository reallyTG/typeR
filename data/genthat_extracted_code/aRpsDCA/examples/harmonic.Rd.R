library(aRpsDCA)


### Name: harmonic
### Title: Arps harmonic declines
### Aliases: harmonic harmonic.q harmonic.Np harmonic.D

### ** Examples

## qi = 1000 Mscf/d, Di = 95% effective / year, t from 0 to 25 days
harmonic.q(1000, as.nominal(0.95, from.period="year", to.period="day"), seq(0, 25))

## qi = 500 bopd, Di = 3.91 nominal / year, t = 5 years
harmonic.Np(rescale.by.time(500, from.period="day", to.period="year"), 3.91, 5)

## Di = 85% effective / year, t = 6 months
harmonic.D(as.nominal(0.85), 0.5)



