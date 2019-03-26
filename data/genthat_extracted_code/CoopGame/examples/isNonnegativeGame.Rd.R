library(CoopGame)


### Name: isNonnegativeGame
### Title: Check if game is nonnegative
### Aliases: isNonnegativeGame

### ** Examples

library(CoopGame)
isNonnegativeGame(c(0,0,0,0.5,0.1,0.4,1))

## No test: 
#Nonnegative game
library(CoopGame) 
v1<-c(0,0,0,0,1,1,1)
isNonnegativeGame(v1)

#Example for game which is not nonnegative 
library(CoopGame)
v2<-c(0,0,0,0,-1.1,1,2)
isNonnegativeGame(v2)
## End(No test)




