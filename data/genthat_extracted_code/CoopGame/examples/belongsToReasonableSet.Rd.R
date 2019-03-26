library(CoopGame)


### Name: belongsToReasonableSet
### Title: Check if point is element of reasonable set
### Aliases: belongsToReasonableSet

### ** Examples

library(CoopGame)
belongsToReasonableSet(x=c(1,0.5,0.5), v=c(0,0,0,1,1,1,2))

## No test: 
library(CoopGame)
v <- c(0,0,0,3,3,3,6)
belongsToReasonableSet(x=c(2,2,2),v)
#[1] TRUE
belongsToReasonableSet(x=c(1,2,4),v)
#[1] FALSE
## End(No test)



