library(coopProductGame)


### Name: owenSet
### Title: Owen Set
### Aliases: owenSet

### ** Examples

# Vector of benefits
c <- c(68, 52)
# Production matrix
A <- matrix(c(4, 5, 6, 2), ncol=2, byrow = TRUE)
# Matrix of resources. Each row is the vector of resources of each player
B <- matrix(c(4, 6, 60, 33, 39, 0),ncol = 3, byrow = TRUE)
# Solution of the associated linear production game
owenSet(c, A, B, show.data = TRUE)

 # ------------------------------------------------------------------------
 # The linear production problem has a unique Owen's allocation:
 # ------------------------------------------------------------------------
 # [1] "(230, 282, 480)"
  



