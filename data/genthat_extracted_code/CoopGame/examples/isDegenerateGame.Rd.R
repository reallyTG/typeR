library(CoopGame)


### Name: isDegenerateGame
### Title: Check if game is degenerate
### Aliases: isDegenerateGame isInEssentialGame isInessentialGame

### ** Examples

library(CoopGame)
isDegenerateGame(c(1,2,3,4,4,4,6))

## No test: 
#The following game, i.e. the Maschler game, is not degenerate
library(CoopGame)
v1 <- c(0,0,0,60,60,60,72)
isDegenerateGame(v1) 

#The following game is also not degenerate
library(CoopGame)
v2 <- c(30,30,15,60,60,60,72)
isDegenerateGame(v2)

#The following game is degenerate
library(CoopGame)
v3 <- c(20,20,32,60,60,60,72)
isDegenerateGame(v3)
## End(No test)




