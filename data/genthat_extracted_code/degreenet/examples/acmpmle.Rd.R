library(degreenet)


### Name: acmpmle
### Title: Conway Maxwell Poisson Modeling of Discrete Data
### Aliases: acmpmle dcmp llcmpall cmp.mutonatural cmp.naturaltomu
###   dcmp.natural dcmp_mu ldcmp.natural llcmp llcmpall
### Keywords: models

### ** Examples


# Simulate a Conway Maxwell Poisson distribution over 100
# observations with mean of 7 and variance of 3
# This leads to a mean of 1

set.seed(1)
s4 <- simcmp(n=100, v=c(7,3))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameters
#

acmpmle(s4)




