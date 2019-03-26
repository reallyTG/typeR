library(MCDM)


### Name: TOPSISVector
### Title: Implementation of TOPSIS Method for Multi-Criteria Decision
###   Making Problems.
### Aliases: TOPSISVector

### ** Examples


 d <- matrix(c(6,7,10,2,2.75,3.5),nrow = 3,ncol = 2)
 w <- c(0.5,0.5)
 cb <- c('min','max')
 TOPSISVector(d,w,cb)



