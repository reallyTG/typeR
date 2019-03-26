library(CoopGame)


### Name: isMonotonicGame
### Title: Check if game is monotonic
### Aliases: isMonotonicGame

### ** Examples

library(CoopGame)
isMonotonicGame(c(0,0,0,1,0,1,1))

## No test: 
#Example of a non-monotonic game
library(CoopGame)
v1=c(4,2,5,2,3,6,10)
isMonotonicGame(v1)

#Example of a monotonic game
library(CoopGame)
v2=c(2,5,7,10, 9, 13,20)
isMonotonicGame(v2)
## End(No test)




