library(degreenet)


### Name: aplnmle
### Title: Poisson Lognormal Modeling of Discrete Data
### Aliases: aplnmle dpln ldpln llplnall
### Keywords: models

### ** Examples


# Simulate a Poisson Lognormal distribution over 100
# observations with lognormal mean of -1 and lognormal variance of 1
# This leads to a mean of 1

set.seed(1)
s4 <- simpln(n=100, v=c(-1,1))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameters
#

s4est <- aplnmle(s4)
s4est

# Calculate the MLE and an asymptotic confidence
# interval for rho under the Yule model
#

s4yuleest <- ayulemle(s4)
s4yuleest

# Calculate the MLE and an asymptotic confidence
# interval for rho under the Waring model
#

s4warest <- awarmle(s4)
s4warest

#
# Compare the AICC and BIC for the three models
#

llplnall(v=s4est$theta,x=s4)
llyuleall(v=s4yuleest$theta,x=s4)
llwarall(v=s4warest$theta,x=s4)




