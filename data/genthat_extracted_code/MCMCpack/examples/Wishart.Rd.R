library(MCMCpack)


### Name: Wishart
### Title: The Wishart Distribution
### Aliases: Wishart dwish rwish rwish dwish
### Keywords: distribution

### ** Examples


density <- dwish(matrix(c(2,-.3,-.3,4),2,2), 3, matrix(c(1,.3,.3,1),2,2))
draw <- rwish(3, matrix(c(1,.3,.3,1),2,2))




