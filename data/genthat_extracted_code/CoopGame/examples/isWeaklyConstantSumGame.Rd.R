library(CoopGame)


### Name: isWeaklyConstantSumGame
### Title: Check if game is weakly constant-sum
### Aliases: isWeaklyConstantSumGame isWeaklyConstantsumGame

### ** Examples

library(CoopGame)
v1=c(0,0,0,2,2,2,2) 
isWeaklyConstantSumGame(v1)

## No test: 
#Example of a game that is not weakly constant-sum 
library(CoopGame)
v2=c(0,0,0,40,30,130,100) 
isWeaklyConstantSumGame(v2)

#Another example of a weakly constant-sum game
library(CoopGame)
v3=c(1,1,1,2, 7,7,7,7,7,7, 2,3,3,3, 4)
isWeaklyConstantSumGame(v3)
## End(No test)




