library(XVector)


### Name: slice-methods
### Title: Slice an XInteger or XDouble object
### Aliases: slice-methods slice,integer-method slice,XInteger-method
###   slice,numeric-method slice,XDouble-method
### Keywords: methods

### ** Examples

vec <- as.integer(c(19, 5, 0, 8, 5))
slice(vec, lower=5, upper=8)

set.seed(0)
vec <- sample(24)
slice(vec, lower=4, upper=16)



