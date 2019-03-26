library(aRpsDCA)


### Name: arps.eur
### Title: EUR and time-to-limit for Arps decline curves
### Aliases: arps.eur arps.t.el

### ** Examples

## exponential decline with
## qi = 1000 Mscf/d, Di = 95% effective / year
## EUR with economic limit 10 Mscf/d
decline <- arps.decline(1000,
    as.nominal(0.95, from.period="year", to.period="day"))
arps.eur(decline, 10)

## hyperbolic decline with
## qi = 500 bopd, Di = 3.91 nominal / year, b = 1.5,
## time to reach economic limit of 3 bopd
decline <- arps.decline(rescale.by.time(500, from="day", to="year"),
    3.91, 1.5)
arps.t.el(decline, rescale.by.time(3, from="day", to="year"))



