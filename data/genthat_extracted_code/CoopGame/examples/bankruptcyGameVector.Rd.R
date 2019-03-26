library(CoopGame)


### Name: bankruptcyGameVector
### Title: Compute game vector for a bankruptcy game
### Aliases: bankruptcyGameVector

### ** Examples

library(CoopGame)
bankruptcyGameVector(n=3, d=c(1,2,3), E=4)

## No test: 
#Estate division problem from Babylonian Talmud
#from paper by Aumann (2002) with E=300
library(CoopGame)
bankruptcyGameVector(n=3,d=c(100,200,300),E=300)
#Output
#[1] 0   0   0   0 100 200 300
## End(No test)




