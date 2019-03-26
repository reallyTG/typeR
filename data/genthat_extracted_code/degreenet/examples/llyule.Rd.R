library(degreenet)


### Name: llyule
### Title: Calculate the Conditional log-likelihood for Count Distributions
### Aliases: llyule llwar lldp lldp.good llgeo llgp llgp.good llgw llgy
###   llgy0 llnb llnb0 llnbw llnby llnby0 llnbzero llpe llpoi llsgeo
### Keywords: models

### ** Examples


# Simulate a Yule distribution over 100
# observations with rho=4.0

set.seed(1)
s4 <- simyule(n=100, rho=4)
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for rho
#

s4est <- ayulemle(s4)
s4est

#
# Calculate the MLE and an asymptotic confidence
# interval for rho under the Waring model (i.e., rho=4, p=2/3)
#

s4warest <- awarmle(s4)
s4warest

#
# Compare the log-likelihoods for the two models
#

llyule(v=s4est$theta,x=s4)
llwar(v=s4warest$theta,x=s4)




