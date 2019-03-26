library(ForeCA)


### Name: continuous_entropy
### Title: Shannon entropy for a continuous pdf
### Aliases: continuous_entropy
### Keywords: math univar

### ** Examples

# entropy of U(a, b) = log(b - a). Thus not necessarily positive anymore, e.g.
continuous_entropy(function(x) dunif(x, 0, 0.5), 0, 0.5) # log2(0.5)

# Same, but for U(-1, 1)
my_density <- function(x){
  dunif(x, -1, 1)
}
continuous_entropy(my_density, -1, 1) # = log(upper - lower)

# a 'triangle' distribution
continuous_entropy(function(x) x, 0, sqrt(2))




