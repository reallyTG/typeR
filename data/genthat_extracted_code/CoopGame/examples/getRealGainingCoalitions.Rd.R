library(CoopGame)


### Name: getRealGainingCoalitions
### Title: Compute real gaining coalitions of game
### Aliases: getRealGainingCoalitions

### ** Examples

library(CoopGame)
getRealGainingCoalitions(v=c(0,0,0,0,0,0,2))

## No test: 
library(CoopGame)
v <- c(1,2,3,4,0,0,0)
getRealGainingCoalitions(v)
# Output:
#    V1 V2 V3 cVal
# 1  1  0  0    1
# 2  0  1  0    2
# 3  0  0  1    3
# 4  1  1  0    4
## End(No test)




