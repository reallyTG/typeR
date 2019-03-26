library(CoopGame)


### Name: nucleolus
### Title: Compute nucleolus
### Aliases: nucleolus

### ** Examples

library(CoopGame)
nucleolus(c(1, 1, 1, 2, 3, 4, 5))

## No test: 
library(CoopGame)
nucleolus(c(0, 0, 0, 0, 5, 5, 8, 9, 10, 8, 13, 15, 16, 17, 21))
#[1] 3.5 4.5 5.5 7.5

#Final example:
#Estate division problem from Babylonian Talmud with E=300,
#see e.g. seminal paper by Aumann & Maschler from 1985 on
#'Game Theoretic Analysis of a Bankruptcy Problem from the Talmud'
library(CoopGame)
v<-bankruptcyGameVector(n=3,d=c(100,200,300),E=300)
nucleolus(v)
#[1]  50 100 150
## End(No test)




