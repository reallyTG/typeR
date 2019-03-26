library(degreenet)


### Name: bspln
### Title: Calculate Bootstrap Estimates and Confidence Intervals for the
###   Poisson Lognormal Distribution
### Aliases: bspln bootstrappln bootstrapplnconc
### Keywords: models

### ** Examples

# Now, simulate a Poisson Lognormal distribution over 100
# observations with expected count 1 and probability of another
# of 0.2

set.seed(1)
s4 <- simpln(n=100, v=c(5,0.2))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameter.
#

s4est <- aplnmle(s4)
s4est

#
# Use the bootstrap to compute a confidence interval rather than using the 
# asymptotic confidence interval for the parameter.
#

bspln(s4, m=5)



