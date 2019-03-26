library(degreenet)


### Name: bsyule
### Title: Calculate Bootstrap Estimates and Confidence Intervals for the
###   Yule Distribution
### Aliases: bsyule bootstrapyule
### Keywords: models

### ** Examples

# Now, simulate a Yule distribution over 100
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
# Use the bootstrap to compute a confidence interval rather than using the 
# asymptotic confidence interval for rho.
#

bsyule(s4, m=20)



