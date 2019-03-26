library(CoopGame)


### Name: bankruptcyGameValue
### Title: Compute value of a coalition for a bankruptcy game
### Aliases: bankruptcyGameValue

### ** Examples

library(CoopGame)
bankruptcyGameValue(S=c(2,3),d=c(1,2,3),E=4)

## No test: 
#Estate division problem from Babylonian Talmud 
#from paper by Aumann (2002) with E=300
library(CoopGame)
bankruptcyGameValue(S=c(2,3),d=c(100,200,300),E=300)
#Output
#[1] 200
## End(No test)




