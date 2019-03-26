library(MCDM)


### Name: MetaRanking
### Title: Implementation of MetaRanking function for Multi-Criteria
###   Decision Making Problems.
### Aliases: MetaRanking

### ** Examples


 d <- matrix(c(1,2,5,3000,3750,4500),nrow = 3,ncol = 2)
 w <- c(0.5,0.5)
 cb <- c('min','max')
 lambda <- 0.5
 v <- 0.5
 AB <- matrix(c(1,5,3000,4500),nrow = 2,ncol=2)
 CD <- matrix(c(1,1,4500,4500),nrow = 2,ncol=2)
 MetaRanking(d,w,cb,lambda,v,AB,CD)



