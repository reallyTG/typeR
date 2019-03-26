library(degreenet)


### Name: bsnb
### Title: Calculate Bootstrap Estimates and Confidence Intervals for the
###   Negative Binomial Distribution
### Aliases: bsnb bootstrapnb
### Keywords: models

### ** Examples

# Now, simulate a Negative Binomial distribution over 100
# observations with expected count 1 and probability of another
# of 0.2

set.seed(1)
s4 <- simnb(n=100, v=c(5,0.2))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameter.
#

s4est <- anbmle(s4)
s4est

#
# Use the bootstrap to compute a confidence interval rather than using the 
# asymptotic confidence interval for the parameter.
#

bsnb(s4, m=20)



