library(aRpsDCA)


### Name: curtailed
### Title: Arps decline curves with initial curtailment
### Aliases: curtailed curtail curtailed.q curtailed.Np curtailed.D
###   arps.q.curtailed arps.Np.curtailed arps.D.curtailed

### ** Examples

## qi = 1000 Mscf/d, Di = 95% effective / year, b = 1.2, t from 0 to 25 days,
## curtailed until 5 days
curtailed.q(arps.decline(
        1000,
        as.nominal(0.95, from.period="year", to.period="day"),
        1.2
    ),
    5, seq(0, 25))

## hyperbolic decline with
## qi = 500 bopd, Di = 3.91 nominal / year, b = 1.5,
## curtailed for 1 month
## cumulative production at t = 5 years
decline <- curtail(
    arps.decline(rescale.by.time(500, from="day", to="year"),
                 3.91, 1.5),
    (1 / 12)
)
arps.Np(decline, 5)



