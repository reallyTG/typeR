library(CoopGame)


### Name: bankruptcyGame
### Title: Construct a bankruptcy game
### Aliases: bankruptcyGame

### ** Examples

library(CoopGame)
bankruptcyGame(n=3, d=c(1,2,3), E=4)

## No test: 
#Estate division problem from Babylonian Talmud 
#from paper by Aumann (2002) with E=300
library(CoopGame)
bankruptcyGame(n=3,d=c(100,200,300),E=300)
#Output
#$n
#[1] 3

#$d
#[1] 100 200 300

#$E
#[1] 300

#$v
#[1]   0   0   0   0 100 200 300
## End(No test)




