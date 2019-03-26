library(SSM)


### Name: sensitivity.plot
### Title: Plot the sensitivity indices of a smooth supersaturated model.
### Aliases: sensitivity.plot

### ** Examples

# A 20 point design in four variables
X <- matrix(runif(80, -1, 1), ncol = 4)
Y <- runif(20)
s <- fit.ssm(X, Y, SA = TRUE)
sensitivity.plot(s)

# In the next plots, the grey bars indicate interactions.
sensitivity.plot(s, "sobol")
sensitivity.plot(s, "total")
# Identifying particular indices is best done using the information held in
# the SSM object.  The following orders s@total_int_factors so the
# interaction indicated by the top row is the most important.
ind <- order(s@total_int, decreasing = TRUE)
s@total_int_factors[ind, ]



