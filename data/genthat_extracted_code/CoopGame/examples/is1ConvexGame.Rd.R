library(CoopGame)


### Name: is1ConvexGame
### Title: Check if game is 1-Convex
### Aliases: is1ConvexGame

### ** Examples

library(CoopGame)
is1ConvexGame(c(0,0,0,9,9,12,18))

## No test: 
#1-convex game (taken from book by T. Driessen, p. 75)
library(CoopGame)
v=c(0,0,0,9,9,15,18)
is1ConvexGame(v)

#Example of a game which is not 1-convex 
library(CoopGame)
v=c(1:7)
is1ConvexGame(v)
## End(No test)




