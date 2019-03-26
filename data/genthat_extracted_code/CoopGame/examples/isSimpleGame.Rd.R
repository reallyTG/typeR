library(CoopGame)


### Name: isSimpleGame
### Title: Check if game is simple
### Aliases: isSimpleGame

### ** Examples

library(CoopGame)
isSimpleGame(c(0,0,0,1,0,1,1))

## No test: 
#Example of a simple game
library(CoopGame) 
v1<-c(0,0,0,0,1,1,1)
isSimpleGame(v1)

#Example of a game which not simple 
library(CoopGame)
v2<-c(0,0,0,0,1,1,2)
isSimpleGame(v2)

#Another example of a game which not simple 
#according to our definition
library(CoopGame) 
v3<-c(1,0,0,0,1,1,1)
isSimpleGame(v3)
## End(No test)




