library(CoopGame)


### Name: isSymmetricGame
### Title: Check if game is symmetric
### Aliases: isSymmetricGame

### ** Examples

library(CoopGame)
isSymmetricGame(c(0,0,0,1,1,1,2))

## No test: 
#Example of a symmetric game
library(CoopGame) 
v1<-c(3,3,3,10,10,10,17)
isSymmetricGame(v1)

#Example of a game which is not symmetric 
library(CoopGame) 
v2=c(1:7)
isSymmetricGame(v2)
## End(No test)




