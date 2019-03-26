library(CoopGame)


### Name: isQuasiBalancedGame
### Title: Check if game is quasi-balanced
### Aliases: isQuasiBalancedGame

### ** Examples

library(CoopGame)
isQuasiBalancedGame(c(0,0,0,1,1,1,4))

## No test: 
#Example of a quasi-balanced game:
library(CoopGame)
v1=c(1,1,2,6,8,14,16)
isQuasiBalancedGame(v1)

#Example of a game which is not quasi-balanced:
library(CoopGame)
v2=c(1:7)
isQuasiBalancedGame(v2)
## End(No test)




