library(Power2Stage)


### Name: power.tsd.KM
### Title: Power calculation of adaptive 2-stage BE studies (2x2 crossover)
###   (variant of power.2stage to obtain the results of Karalis / Macheras)
### Aliases: power.2stage.KM power.tsd.KM

### ** Examples

# using all the defaults
# but too low number of sims to complain with the CRAN policy:
# "check time only a few seconds per example"
# minimum number of sims should be 1E5 for power, 1E6 sims for 'alpha'
power.tsd.KM(n1=16, CV=0.2, nsims=1E4)
# ~3 sec if nsims=1E5



