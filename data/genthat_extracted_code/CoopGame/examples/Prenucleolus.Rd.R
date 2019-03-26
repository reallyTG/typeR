library(CoopGame)


### Name: Prenucleolus
### Title: Compute prenucleolus
### Aliases: Prenucleolus prenucleolus

### ** Examples

library(CoopGame)
prenucleolus(c(1, 1, 1, 2, 3, 4, 5))

## No test: 
#Example 5.5.12 from Peleg/Sudhoelter, p. 96
library(CoopGame)
prenucleolus(c(0,0,0,10,0,0,2))
#Output
#[1]  3  3 -4
#In the above example nucleolus and prenucleolus do not coincide!

library(CoopGame)
prenucleolus(c(0, 0, 0, 0, 5, 5, 8, 9, 10, 8, 13, 15, 16, 17, 21))
# [1] 3.5 4.5 5.5 7.5

#Final example:
#Estate division problem from Babylonian Talmud with E=200,
#see e.g. seminal paper by Aumann & Maschler from 1985 on
#'Game Theoretic Analysis of a Bankruptcy Problem from the Talmud'
library(CoopGame)
v<-bankruptcyGameVector(n=3,d=c(100,200,300),E=200)
prenucleolus(v)
#[1]  50 75 75
#Note that nucleolus and prenucleolus need to coincide for the above game
## End(No test)




