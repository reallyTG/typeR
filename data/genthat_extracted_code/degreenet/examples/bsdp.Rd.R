library(degreenet)


### Name: bsdp
### Title: Calculate Bootstrap Estimates and Confidence Intervals for the
###   Discrete Pareto Distribution
### Aliases: bsdp bootstrapdp
### Keywords: models

### ** Examples

## Not run: 
##D # Now, simulate a Discrete Pareto distribution over 100
##D # observations with expected count 1 and probability of another
##D # of 0.2
##D 
##D set.seed(1)
##D s4 <- simdp(n=100, v=3.31)
##D table(s4)
##D 
##D #
##D # Calculate the MLE and an asymptotic confidence
##D # interval for the parameter.
##D #
##D 
##D s4est <- adpmle(s4)
##D s4est
##D 
##D #
##D # Use the bootstrap to compute a confidence interval rather than using the 
##D # asymptotic confidence interval for the parameter.
##D #
##D 
##D bsdp(s4, m=20)
## End(Not run)



