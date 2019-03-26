library(degreenet)


### Name: rplnmle
### Title: Rounded Poisson Lognormal Modeling of Discrete Data
### Aliases: rplnmle drpln llrplnall bootstraprpln ldrpln llrpln llrplnall
###   rplnmle
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

s4est <- rplnmle(s4)
s4est




