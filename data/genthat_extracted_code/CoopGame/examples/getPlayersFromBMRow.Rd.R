library(CoopGame)


### Name: getPlayersFromBMRow
### Title: Extract players from bit matrix row
### Aliases: getPlayersFromBMRow

### ** Examples

library(CoopGame)
bm=createBitMatrix(n=3,A=c(0,0,0,1,1,1,2))
getPlayersFromBMRow(bmRow=bm[4,])

## No test: 
library(CoopGame)
bm=createBitMatrix(n=3,A=c(1:7))
#Corresponding bit matrix:
#           cVal
#[1,] 1 0 0    1
#[2,] 0 1 0    2
#[3,] 0 0 1    3
#[4,] 1 1 0    4
#[5,] 1 0 1    5 <=Specified bit index
#[6,] 0 1 1    6
#[7,] 1 1 1    7

#Determine players from bit matrix row by index 5
players=getPlayersFromBMRow(bmRow=bm[5,])
#Result:
players 
#[1] 1 3
## End(No test)




