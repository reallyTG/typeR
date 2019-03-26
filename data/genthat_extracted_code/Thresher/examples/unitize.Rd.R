library(Thresher)


### Name: unitize
### Title: Convert a Vector to Unit Length
### Aliases: unitize
### Keywords: array

### ** Examples

simmat <- matrix(rnorm(12), 3, 4)
U <- unitize(simmat)
apply(U^2, 2, sum)  # check unit length
simmat/U            # view normalization factors



