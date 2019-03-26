library(OpenMx)


### Name: mxFactor
### Title: Fail-safe Factors
### Aliases: mxFactor

### ** Examples

myVar <- c("s", "t", "a", "t", "i", "s", "t", "i", "c", "s")
ff    <- mxFactor(myVar, levels=letters)
# Note: letters is a built in list of all lowercase letters of the alphabet
ff
# [1] s t a t i s t i c s
# Levels: a < b < c < d < e < f < g < h < i < j < k < l < m < n < o < p < q <
#  r < s < t < u < v < w < x < y < z

as.integer(ff)  # the internal codes

factor(ff)      # NOTE: drops the levels that do not occur.
                # mxFactor prevents you doing this unintentionally.

# This example works on a dataframe
foo <- data.frame(x=c(1:3),y=c(4:6),z=c(7:9))

# Applys one set of levels to all three columns
mxFactor(foo, c(1:9))

# Apply unique sets of levels to each variable
mxFactor(foo, list(c(1:3), c(4:6), c(7:9)))


mxFactor(foo, c(1:9), labels=c(1,1,1,2,2,2,3,3,3), collapse=TRUE)




