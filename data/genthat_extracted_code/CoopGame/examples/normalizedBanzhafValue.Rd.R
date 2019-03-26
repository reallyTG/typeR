library(CoopGame)


### Name: normalizedBanzhafValue
### Title: Compute normalized Banzhaf value
### Aliases: normalizedBanzhafValue

### ** Examples

library(CoopGame)
normalizedBanzhafValue(c(0,0,0,1,2,3,6))

## No test: 
#Example from paper by Gambarelli (2011)
library(CoopGame)
v=c(0,0,0,1,2,1,3)
normalizedBanzhafValue(v)
#[1] 1.1538462 0.6923077 1.1538462
#Expected Result: 15/13  9/13  15/13
## End(No test)




