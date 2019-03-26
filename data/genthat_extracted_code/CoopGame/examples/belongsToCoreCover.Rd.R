library(CoopGame)


### Name: belongsToCoreCover
### Title: Check if point is core cover element
### Aliases: belongsToCoreCover

### ** Examples

library(CoopGame)
belongsToCoreCover(x=c(1,1,1), v=c(0,0,0,1,1,1,3))

## No test: 
library(CoopGame)
v <- c(0,0,0,3,3,3,6)
belongsToCoreCover(x=c(2,2,2),v)
#[1] TRUE
belongsToCoreCover(x=c(1,2,4),v)
#[1] FALSE
## End(No test)




