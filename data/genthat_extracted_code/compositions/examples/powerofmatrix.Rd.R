library(compositions)


### Name: powerofpsdmatrix
### Title: power transform of a matrix
### Aliases: powerofpsdmatrix
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
d <- ilr(sa.lognormals)
var( d %*% powerofpsdmatrix(var(d),-1/2)) # Unit matrix



