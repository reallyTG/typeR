library(aRpsDCA)


### Name: hyp2exp
### Title: Arps hyperbolic-to-exponential declines
### Aliases: hyp2exp hyp2exp.q hyp2exp.Np hyp2exp.D hyp2exp.transition

### ** Examples

## qi = 1000 Mscf/d, Di = 95% effective / year, b = 1.2,
## Df = 15% effective / year, t from 0 to 25 years
## result in Mscf/d
hyp2exp.q(1000, as.nominal(0.95), 1.2, as.nominal(0.15), seq(0, 25))

## qi = 500 bopd, Di = 3.91 nominal / year, b = 0.5,
## Df = 0.3 nominal / year, t = 20 years
hyp2exp.Np(rescale.by.time(500, from.period="day", to.period="year"),
    3.91, 0.5, 0.3, 20)

## Di = 85% effective / year, b = 1.5, Df = 15% effective / year,
## t = 6 and 48 months
hyp2exp.D(as.nominal(0.85), 1.5, as.nominal(0.15), c(0.5, 4))

## Di = 85% effective / year, b = 1.5, Df = 5% effective / year
hyp2exp.transition(as.nominal(0.85), 1.5, as.nominal(0.05))



