library(hypergea)


### Name: getMargins
### Title: Marginal sums of multidimensional contingency tables
### Aliases: getMargins

### ** Examples

x <- matrix(c(1:4), nrow=2, ncol=2)
getMargins(x)

x <- matrix(c(1:6), nrow=2, ncol=3)
getMargins(x)

x <- array(c(1:8), dim=c(2,2,2))
getMargins(x)



