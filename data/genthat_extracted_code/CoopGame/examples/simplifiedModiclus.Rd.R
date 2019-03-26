library(CoopGame)


### Name: simplifiedModiclus
### Title: Compute simplified modiclus
### Aliases: simplifiedModiclus

### ** Examples

library(CoopGame)
simplifiedModiclus(c(0, 0, 0, 1, 1, 0, 1))

## No test: 
#Second example:
#Estate division problem from Babylonian Talmud with E=100,
#see e.g. seminal paper by Aumann & Maschler from 1985 on
#'Game Theoretic Analysis of a Bankruptcy Problem from the Talmud'
library(CoopGame)
v<-bankruptcyGameVector(n=3,d=c(100,200,300),E=100)
simplifiedModiclus(v)
#[1]  33.33333 33.33333 33.33333
## End(No test)




