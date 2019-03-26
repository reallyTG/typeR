library(scaRabee)


### Name: bound.parameters
### Title: Forces parameter estimates between defined boundaries.
### Aliases: bound.parameters
### Keywords: method

### ** Examples


bound.parameters(seq(1:5), lb=rep(3,5), ub=rep(4,5))

# The following call should return an error message
bound.parameters(1, lb=rep(3,5), ub=rep(4,5))




