library(genetics)


### Name: ci.balance
### Title: Experimental Function to Correct Confidence Intervals At or Near
###   Boundaries of the Parameter Space by 'Sliding' the Interval on the
###   Quantile Scale.
### Aliases: ci.balance
### Keywords: misc

### ** Examples

# These are nonsensical examples which simply exercise the
# computation. See the code to diseq.ci for a real example.
#
# FIXME: Add real example using boot or bootstrap.  

set.seed(7981357)
x <- abs(rnorm(100,1))
ci.balance(x,1, minval=0)
ci.balance(x,1)

x <- rnorm(100,1)
x <- ifelse(x>1, 1, x)
ci.balance(x,1, maxval=1)
ci.balance(x,1)



