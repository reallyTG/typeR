library(degreenet)


### Name: ayulemle
### Title: Yule Distribution Modeling of Discrete Data
### Aliases: ayulemle dyule ldyule
### Keywords: models

### ** Examples


# Simulate a Yule distribution over 100
# observations with PDf exponent of 3.5

set.seed(1)
s4 <- simyule(n=100, rho=3.5)
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameters
#

s4est <- ayulemle(s4)
s4est

#
# Compute the AICC and BIC for the model
#

llyuleall(v=s4est$theta,x=s4)




