library(degreenet)


### Name: gyulemle
### Title: Models for Count Distributions
### Aliases: gyulemle gwarmle
### Keywords: models

### ** Examples

#
# Simulate a Yule distribution over 100
# observations with rho=4.0
#

set.seed(1)
s4 <- simyule(n=100, rho=4)
table(s4)

#
# Recode it as categorical
#

s4[s4 >  4 & s4 < 11] <- 5
s4[s4 > 100] <- 8
s4[s4 >  20] <- 7
s4[s4 >  10] <- 6

#
# Calculate the MLE and an asymptotic confidence
# interval for rho
#

s4est <- gyulemle(s4)
s4est

#
# Calculate the MLE and an asymptotic confidence
# interval for rho under the Waring model (i.e., rho=4, p=2/3)
#

s4warest <- gwarmle(s4)
s4warest

#
# Compare the AICC and BIC for the two models
#

llgyuleall(v=s4est$theta,x=s4)
llgwarall(v=s4warest$theta,x=s4)




