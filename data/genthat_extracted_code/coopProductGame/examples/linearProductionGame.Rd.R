library(coopProductGame)


### Name: linearProductionGame
### Title: Cooperative linear production games
### Aliases: linearProductionGame

### ** Examples

# Vector of benefits
c <- c(68,52)
# Production matrix
A <- matrix(c(4,5,6,2),ncol=2, byrow = TRUE)
# Matrix of resources. Each column is the vector of resources of each player
B <- matrix(c(4, 6, 60, 33, 39, 0),ncol = 3, byrow = TRUE)
# Solution of the associated linear production game
linearProductionGame(c, A, B, show.data = TRUE)

 # ------------------------------------------------------------------------
 # Optimal solution of the problem for each coalition: 
 # ------------------------------------------------------------------------
 # 
 # S={1}      1.00  0.00
 # S={2}      1.50  0.00
 # S={3}      0.00  0.00
 # S={1,2}    2.50  0.00
 # S={1,3}    1.68 11.45
 # S={2,3}    2.86 10.91
 # S={1,2,3} 10.00  6.00
 # 
 # ------------------------------------------------------------------------
 #   Cooperative production game: 
 # ------------------------------------------------------------------------
 #                S={0} S={1} S={2} S={3} S={1,2} S={1,3} S={2,3} S={1,2,3}
 # Associated game    0    68   102     0     170     710     762       992
 # ------------------------------------------------------------------------

  



