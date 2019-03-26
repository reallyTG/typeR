library(plyr)


### Name: each
### Title: Aggregate multiple functions into a single function.
### Aliases: each
### Keywords: manip

### ** Examples

# Call min() and max() on the vector 1:10
each(min, max)(1:10)
# This syntax looks a little different.  It is shorthand for the
# the following:
f<- each(min, max)
f(1:10)
# Three equivalent ways to call min() and max() on the vector 1:10
each("min", "max")(1:10)
each(c("min", "max"))(1:10)
each(c(min, max))(1:10)
# Call length(), min() and max() on a random normal vector
each(length, mean, var)(rnorm(100))



