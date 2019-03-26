library(MCDM)


### Name: VIKOR
### Title: Implementation of VIKOR Method for Multi-Criteria Decision
###   Making Problems.
### Aliases: VIKOR

### ** Examples


 d <- matrix(c(1,2,5,3000,3750,4500),nrow = 3,ncol = 2)
 w <- c(0.5,0.5)
 cb <- c('min','max')
 v <- 0.5
 VIKOR(d,w,cb,v)



