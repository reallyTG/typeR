library(FuzzyMCDM)


### Name: FuzzyTOPSISLinear
### Title: Implementation of Fuzzy TOPSIS Method for Multi-Criteria
###   Decision Making Problems.
### Aliases: FuzzyTOPSISLinear

### ** Examples


 d <- matrix(c(5.7,6.3,6.3,7.7,8.3,8,9.3,9.7,9,5,9,7,7,10,9,9,10,10,5.7,8.3,7,7.7,9.7,9,
 9,10,10,8.33,9,7,9.67,10,9,10,10,10,3,7,6.3,5,9,8.3,7,10,9.7),nrow=3,ncol=15)
 w <- c(0.7,0.9,1,0.9,1,1,0.77,0.93,1,0.9,1,1,0.43,0.63,0.83)
 cb <- c('max','max','max','max','max')
 FuzzyTOPSISLinear(d,w,cb)



