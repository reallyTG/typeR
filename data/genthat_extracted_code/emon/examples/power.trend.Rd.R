library(emon)


### Name: power.trend
### Title: Calculates power by simulation to detect a specified trend.
### Aliases: power.trend
### Keywords: power trend Mann-Kendall gam

### ** Examples


library(mgcv)

# In practice, \code{nsims} would be set to at least 1000

par(mfrow=c(2,2))
lin5 = generate.trend(nyears=10, change=5, type="linear")
plot(lin5$i, lin5$mu)
updown = generate.trend(nyears=15, change=5, type="updown", changeyear=8)
plot(updown$i, updown$mu)

power.trend(xvalues=lin5$i, meanvalues=lin5$mu, distribution="Normal", sd=2,
            method="linear regression", alpha=0.05, nsims=50)
power.trend(xvalues=lin5$i, meanvalues=lin5$mu, distribution="Poisson", method="mk", alpha=0.05,
      nsims=50)
power.trend(xvalues=updown$i, meanvalues=updown$mu, distribution="Normal", sd=2,
            method="gam", alpha=0.05, nsims=50)



