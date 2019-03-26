library(coopProductGame)


### Name: plotCoreSet
### Title: Plot Core Set for cooperative production linear games.
### Aliases: plotCoreSet

### ** Examples

# Vector of benefits
c <- c(68, 52)
# Production matrix
A <- matrix(c(4, 5, 6, 2), ncol = 2, byrow = TRUE)
# Matrix of resources. Each row is the vector of resources of each player
B <- matrix(c(4, 6, 60, 33, 39, 0), ncol = 3, byrow = TRUE)
# Solution of the associated linear production game
plotCoreSet(c, A, B)
  
  



