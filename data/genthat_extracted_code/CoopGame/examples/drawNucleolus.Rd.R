library(CoopGame)


### Name: drawNucleolus
### Title: Draw nucleolus for 3 or 4 players
### Aliases: drawNucleolus

### ** Examples

library(CoopGame)
v=c(0,0,0,1,1,0,3)
drawNucleolus(v) 

## No test: 
#Visualization for estate division problem from Babylonian Talmud with E=300,
#see e.g. seminal paper by Aumann & Maschler from 1985 on
#'Game Theoretic Analysis of a Bankruptcy Problem from the Talmud'
library(CoopGame)
v<-bankruptcyGameVector(n=3,d=c(100,200,300),E=300)
drawNucleolus(v)
## End(No test)




