library(CoopGame)


### Name: getGainingCoalitions
### Title: Compute gaining coalitions of a TU game
### Aliases: getGainingCoalitions

### ** Examples

library(CoopGame)
getGainingCoalitions(v=c(0,0,0,2,0,2,3))

## No test: 
library(CoopGame)
v <- c(1,2,3,4,0,0,11)
getGainingCoalitions(v)
# Output:
#    V1 V2 V3 cVal
# 1  1  0  0    1
# 2  0  1  0    2
# 3  0  0  1    3
# 4  1  1  0    4
# 7  1  1  1   11
## End(No test)




