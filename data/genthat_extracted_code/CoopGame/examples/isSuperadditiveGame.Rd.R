library(CoopGame)


### Name: isSuperadditiveGame
### Title: Check if game is superadditive
### Aliases: isSuperadditiveGame isSuperAdditiveGame

### ** Examples

library(CoopGame)
isSuperadditiveGame(c(0,0,0,1,1,1,2))

## No test: 
#Example of a superadditive game
library(CoopGame)
v1=c(0,0,0,40,50,20,100) 
isSuperadditiveGame(v1)

#Example of a game that is not superadditive 
library(CoopGame)
v2=c(0,0,0,40,30,130,100) 
isSuperadditiveGame(v2)

#Another example of a superadditive game
library(CoopGame)
v3=c(1,1,1,1, 2,2,2,2,2,2, 3,3,3,3, 4)
isSuperadditiveGame(v3)
## End(No test)




