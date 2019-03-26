library(CoopGame)


### Name: isConvexGame
### Title: Check if game is convex
### Aliases: isConvexGame

### ** Examples

library(CoopGame)
isConvexGame(c(0,0,0,1,1,1,5))

## No test: 
#Example of a convex game with three players
library(CoopGame) 
v=c(0,0,0,1,2,1,4)
isConvexGame(v)

#Example of a nonconvex game
library(CoopGame) 
v=c(1:7)
isConvexGame(v)
## End(No test)




