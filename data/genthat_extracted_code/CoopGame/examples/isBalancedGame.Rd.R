library(CoopGame)


### Name: isBalancedGame
### Title: Check if game is balanced
### Aliases: isBalancedGame

### ** Examples

library(CoopGame)
v=c(0,0,0,40,50,20,100)
isBalancedGame(v)

## No test: 
#Example of an unbalanced game with 3 players
library(CoopGame)
v=c(1,1,1,2,3,4,3)
isBalancedGame(v)

#Example of an unbalanced game with 4 players
library(CoopGame)
v=c(0,0,0,0,1,0,0,0,0,3,3,3,3,3,4)
isBalancedGame(v)

#Example of a balanced game with 4 players
library(CoopGame)
v= c(0,0,0,0,1,0,0,0,0,2,2,2,2,2,4)
isBalancedGame(v)
## End(No test)




