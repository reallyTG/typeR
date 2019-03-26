library(CoopGame)


### Name: getCriticalCoalitionsOfPlayer
### Title: Compute critical coalitions of a player for simple games
### Aliases: getCriticalCoalitionsOfPlayer

### ** Examples

library(CoopGame)
getCriticalCoalitionsOfPlayer(2,v=c(0,0,0,0,0,1,1))

## No test: 
library(CoopGame)
v=c(0,1,0,1,0,1,1)

#Get coalitions where player 2 is critical:
getCriticalCoalitionsOfPlayer(2,v)
#Output are all coalitions where player 2 is involved.
#Observe that player 2 is dictator in this game.
#
#     V1 V2 V3 cVal bmRow
#  2  0  1  0    1     2
#  4  1  1  0    1     4
#  6  0  1  1    1     6
#  7  1  1  1    1     7
## End(No test)




