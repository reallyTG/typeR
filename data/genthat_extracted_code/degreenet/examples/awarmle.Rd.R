library(degreenet)


### Name: awarmle
### Title: Waring Modeling of Discrete Data
### Aliases: awarmle dwar ldwar llwarall
### Keywords: models

### ** Examples


# Simulate a Waring distribution over 100
# observations with a PDf exponent of 3.5 and a 
# probability of including a new actor of 0.1

set.seed(1)
s4 <- simwar(n=100, v=c(3.5,0.1))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameters
#

s4est <- awarmle(s4)
s4est

# Calculate the MLE and an asymptotic confidence
# interval for rho under the Yule model
#

s4yuleest <- ayulemle(s4)
s4yuleest

#
# Compare the AICC and BIC for the two models
#

llwarall(v=s4est$theta,x=s4)
llyuleall(v=s4yuleest$theta,x=s4)




