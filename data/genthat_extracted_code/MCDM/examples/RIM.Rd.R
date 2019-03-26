library(MCDM)


### Name: RIM
### Title: Implementation of RIM Method for Multi-Criteria Decision Making
###   Problems.
### Aliases: RIM

### ** Examples


 d <- matrix(c(30,40,25,27,45,0,9,0,0,15,2,1,3,5,2,3,3,1,3,2,3,2,3,3,3,2,2,2,1,4),
 nrow = 5, ncol = 6)
 w <- c(0.2262,0.2143,0.1786,0.1429,0.119,0.119)
 AB = matrix(c(23,60,0,15,0,10,1,3,1,3,1,5),nrow = 2,ncol = 6)
 CD = matrix(c(30,35,10,15,0,0,3,3,3,3,4,5),nrow = 2,ncol = 6)
 RIM(d,w,AB,CD)



