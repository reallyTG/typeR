library(PowerTOST)


### Name: power.2TOST
### Title: Power for two simultaneous TOST procedures
### Aliases: power.2TOST

### ** Examples

# Power for the 2x2x2 cross-over design with 24 subjects, intra-subject
# standard deviation of 0.3 (CV = 30.7%) and assumed ratios of 1.05 for both
# parameters, and correlation 0.75 between parameters (using all the other
# default values)
power.2TOST(theta0 = rep(1.05, 2), CV = rep(se2CV(0.3), 2),
            n = 24, rho = 0.75)
# should give: 0.38906

# Setting as before but use rho ~ 1 to replicate result of power.TOST()
p1 <- power.2TOST(theta0 = rep(1.05, 2), CV = rep(se2CV(0.3), 2),
                  n = 24, rho = 0.99999999, nsims=1E6)
p2 <- power.TOST(theta0 = 1.05, CV = se2CV(0.3), n = 24)
all.equal(p1, p2, tolerance = 1e-03)



