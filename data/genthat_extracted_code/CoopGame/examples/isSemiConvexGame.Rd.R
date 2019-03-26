library(CoopGame)


### Name: isSemiConvexGame
### Title: Check if game is semiconvex
### Aliases: isSemiConvexGame

### ** Examples

library(CoopGame)
isSemiConvexGame(c(0,0,0,1,1,1,4))

## No test: 
#Example of a semiconvex game 
library(CoopGame)
v1<-c(3,4,5,9,10,11,18)
isSemiConvexGame(v1)

#Example of a game which not semiconvex 
library(CoopGame)
v2=c(1:7)
isSemiConvexGame(v2)
## End(No test)




