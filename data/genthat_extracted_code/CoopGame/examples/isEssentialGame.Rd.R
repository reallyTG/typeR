library(CoopGame)


### Name: isEssentialGame
### Title: Check if game is essential
### Aliases: isEssentialGame

### ** Examples

library(CoopGame)
isEssentialGame(c(1,2,3,4,4,4,7))

## No test: 
# Example of an essential game
library(CoopGame)
v1 <- c(0,0,0,60,60,60,72)
isEssentialGame(v1)

# Example of a game that is not essential  
library(CoopGame)
v2 <- c(30,30,15,60,60,60,72)
isEssentialGame(v2)

# Example of a game that is not essential 
library(CoopGame)
v3 <- c(20,20,32,60,60,60,72)
isEssentialGame(v3)
## End(No test)




