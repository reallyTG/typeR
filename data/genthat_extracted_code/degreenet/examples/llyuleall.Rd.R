library(degreenet)


### Name: llyuleall
### Title: Calculate the log-likelihood for Count Distributions
### Aliases: llyuleall lldpall llgeoall llgpall llgwall llgy0all llgyall
###   llnb0all llnball llnbwall llnby0all llnbyall llnbzeroall llpeall
###   llpoiall llsgeoall
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

# Calculate the MLE and an asymptotic confidence
# interval for rho under the Waring model (i.e., rho=4, p=2/3)
#

s4warest <- awarmle(s4)
s4warest

#
# Compare the AICC and BIC for the two models
#

llyuleall(v=s4est$theta,x=s4)
llwarall(v=s4warest$theta,x=s4)




