library(CoopGame)


### Name: isConstantSumGame
### Title: Check if game is constant-sum
### Aliases: isConstantSumGame isConstantsumGame

### ** Examples

library(CoopGame)
v=c(0,0,0,2,2,2,2) 
isConstantSumGame(v)

## No test: 
#Example of a game that is not constant-sum 
library(CoopGame)
v=c(0,0,0,40,30,130,100) 
isConstantSumGame(v)

#Another example of a constant-sum game
library(CoopGame)
v=c(1,1,1,2, 2,2,2,2,2,2, 2,3,3,3, 4)
isConstantSumGame(v)
## End(No test)




