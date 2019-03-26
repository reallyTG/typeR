library(aRpsDCA)


### Name: arps
### Title: Arps decline classes and S3 methods
### Aliases: arps arps.decline arps.q arps.Np arps.D arps.q.arps
###   arps.Np.arps arps.D.arps arps.q.exponential arps.Np.exponential
###   arps.D.exponential arps.q.hyperbolic arps.Np.hyperbolic
###   arps.D.hyperbolic arps.q.hyp2exp arps.Np.hyp2exp arps.D.hyp2exp

### ** Examples

## exponential decline with
## qi = 1000 Mscf/d, Di = 95% effective / year
## rate for t from 0 to 25 days
decline <- arps.decline(1000,
    as.nominal(0.95, from.period="year", to.period="day"))
arps.q(decline, seq(0, 25))

## hyperbolic decline with
## qi = 500 bopd, Di = 3.91 nominal / year, b = 1.5,
## cumulative production at t = 5 years
decline <- arps.decline(
    rescale.by.time(500, from="day", to="year", method="rate"),
    3.91, 1.5)
arps.Np(decline, 5)



