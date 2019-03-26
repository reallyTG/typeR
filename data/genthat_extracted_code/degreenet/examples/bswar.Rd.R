library(degreenet)


### Name: bswar
### Title: Calculate Bootstrap Estimates and Confidence Intervals for the
###   Waring Distribution
### Aliases: bswar bootstrapwar
### Keywords: models

### ** Examples

# Now, simulate a Waring distribution over 100
# observations with expected count 1 and probability of another
# of 0.2

set.seed(1)
s4 <- simwar(n=100, v=c(5,0.2))
table(s4)

#
# Calculate the MLE and an asymptotic confidence
# interval for the parameter.
#

s4est <- awarmle(s4)
s4est

#
# Use the bootstrap to compute a confidence interval rather than using the 
# asymptotic confidence interval for the parameter.
#

bswar(s4, m=20)



