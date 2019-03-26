library(CoopGame)


### Name: isAdditiveGame
### Title: Check if game is additive
### Aliases: isAdditiveGame

### ** Examples

library(CoopGame)
isAdditiveGame(c(1,1,1,2,2,2,3))

## No test: 
#The following game is not additive
library(CoopGame)
v=c(0,0,0,40,50,20,100)
isAdditiveGame(v) 

#The following game is additive
library(CoopGame)
v=c(1,1,1,1, 2,2,2,2,2,2, 3,3,3,3, 4)
isAdditiveGame(v)
## End(No test)




