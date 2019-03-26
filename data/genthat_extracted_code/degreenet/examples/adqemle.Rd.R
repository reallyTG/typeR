library(degreenet)


### Name: adqemle
### Title: Discrete version of q-Exponential Modeling of Discrete Data
### Aliases: adqemle lldqe simdqe ddqe lddqe lldqeall
### Keywords: models

### ** Examples


# Simulate a Discrete version of q-Exponential distribution over 100
# observations with a PDF exponent of 3.5 and a 
# sigma scale of 1

set.seed(1)
s4 <- simdqe(n=100, v=c(3.5,1))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameters
#

s4est <- adqemle(s4)
s4est

# Calculate the MLE and an asymptotic confidence
# interval for rho under the Yule model
#

s4yuleest <- ayulemle(s4)
s4yuleest

#
# Compare the AICC and BIC for the two models
#

lldqeall(v=s4est$theta,x=s4)
llyuleall(v=s4yuleest$theta,x=s4)




