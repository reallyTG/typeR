library(coopProductGame)


### Name: productLinearProblem
### Title: Linear production programming problems
### Aliases: productLinearProblem

### ** Examples

# Vector of benefits
c <- c(68,52)
# Production matrix
A <- matrix(c(4,5,6,2),ncol=2, byrow = TRUE)
# Matrix of resources. Each row is the vector of resources of each player
b <- c(4,33)
# Solution of the associated linear production game
productLinearProblem(c,A,b, show.data = TRUE)

# ------------------------------------------------------------------------
# Objetive value: 
# ------------------------------------------------------------------------
#   [1] "Z = 68"
# 
# ------------------------------------------------------------------------
# Optimal solution: 
# ------------------------------------------------------------------------
#   [1] 1 0
# ------------------------------------------------------------------------
  



