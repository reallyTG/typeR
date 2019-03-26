library(CoopGame)


### Name: gloveGame
### Title: Construct a glove game
### Aliases: gloveGame

### ** Examples

library(CoopGame)
gloveGame(n=3,L=c(1,2), R=c(3))

## No test: 
#Example with four players: 
#players 1, 2 and 4 hold a left-hand glove each, 
#player 3 holds a right-hand glove. 
library(CoopGame)
(vv<-gloveGame(n=4,L=c(1,2,4), R=c(3)))
#$n
#[1] 3

#$L
#[1] 1 2 4
#
#$R
#[1] 3
#
#$v
#[1] 0 0 0 0 0 1 0 1 0 1 1 0 1 1 1
## End(No test)




