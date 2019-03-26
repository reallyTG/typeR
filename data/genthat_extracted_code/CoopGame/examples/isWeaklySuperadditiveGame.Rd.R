library(CoopGame)


### Name: isWeaklySuperadditiveGame
### Title: Check if game is weakly superadditive
### Aliases: isWeaklySuperadditiveGame isZeroMonotonicGame
###   isWeaklySuperAdditiveGame

### ** Examples

library(CoopGame)
isWeaklySuperadditiveGame(c(0,0,0,1,1,1,1))

## No test: 
#Example of a weakly superadditive game
library(CoopGame)
v1=c(1:15)
isWeaklySuperadditiveGame(v1)

#Example of a game which is not weakly superadditive
library(CoopGame)
v2=c(1:5,7,7)
isWeaklySuperadditiveGame(v2)
## End(No test)




