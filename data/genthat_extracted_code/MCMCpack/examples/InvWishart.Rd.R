library(MCMCpack)


### Name: InvWishart
### Title: The Inverse Wishart Distribution
### Aliases: InvWishart diwish riwish riwish diwish
### Keywords: distribution

### ** Examples


density <- diwish(matrix(c(2,-.3,-.3,4),2,2), 3, matrix(c(1,.3,.3,1),2,2))
draw <- riwish(3, matrix(c(1,.3,.3,1),2,2))




