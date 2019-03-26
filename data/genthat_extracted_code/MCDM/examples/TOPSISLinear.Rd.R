library(MCDM)


### Name: TOPSISLinear
### Title: Implementation of TOPSIS Method for Multi-Criteria Decision
###   Making Problems.
### Aliases: TOPSISLinear

### ** Examples


 d <- matrix(c(1,4,3,5,2,3),nrow = 3,ncol = 2)
 w <- c(0.5,0.5)
 cb <- c('max','max')
 TOPSISLinear(d,w,cb)



