library(degreenet)


### Name: llpln
### Title: Calculate the Conditional log-likelihood for the Poisson
###   Lognormal Distributions
### Aliases: llpln
### Keywords: models

### ** Examples


# Simulate a Poisson Lognormal distribution over 100
# observations with lognormal mean -1 and logormal standard deviation 1.

set.seed(1)
s4 <- simpln(n=100, v=c(-1,1))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for rho
#

s4est <- aplnmle(s4)
s4est

#
# Calculate the MLE and an asymptotic confidence
# interval for rho under the Waring model
#

s4warest <- awarmle(s4)
s4warest

#
# Compare the log-likelihoods for the two models
#

llpln(v=s4est$theta,x=s4)
llwar(v=s4warest$theta,x=s4)




