library(CoopGame)


### Name: getMinimalRights
### Title: Compute minimal rights vector
### Aliases: getMinimalRights getMinimalRightsVector

### ** Examples

library(CoopGame)
getMinimalRights(c(0,0,0,1,0,1,1))

## No test: 
library(CoopGame)
v1 <- c(0,0,0,60,60,60,72)
getMinimalRights(v1)
#[1] 48 48 48

library(CoopGame)
v2 <- c(2,4,5,18,14,9,24) 
getMinimalRights(v2)
#[1] 8 4 5
## End(No test)




