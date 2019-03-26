library(CoopGame)


### Name: createBitMatrix
### Title: create bit matrix
### Aliases: createBitMatrix

### ** Examples

library(CoopGame)
createBitMatrix(3,c(0,0,0,60,60,60,72))

## No test: 
library(CoopGame)
A=weightedVotingGameVector(n=3,w=c(1,2,3),q=5)
bm=createBitMatrix(3,A)
bm
# Output:
#            cVal
# [1,] 1 0 0    0
# [2,] 0 1 0    0
# [3,] 0 0 1    0
# [4,] 1 1 0    0
# [5,] 1 0 1    0
# [6,] 0 1 1    1
# [7,] 1 1 1    1
## End(No test)



