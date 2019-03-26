library(CoopGame)


### Name: iskConvexGame
### Title: Check if game is k-Convex
### Aliases: iskConvexGame

### ** Examples

library(CoopGame)
iskConvexGame(v=c(0,0,0,9,9,12,18), k=1)

## No test: 
# Two examples motivated by the book by T. Driessen, p. 175:
#
# The following game is 2-convex 
library(CoopGame)
alpha = 0.4
v=c(0,0,0,alpha,alpha,0,1)
iskConvexGame(v,2)

# The following game is not 2-convex 
library(CoopGame)
alpha = 0.7
v=c(0,0,0,alpha,alpha,0,1)
iskConvexGame(v,2)
## End(No test)




