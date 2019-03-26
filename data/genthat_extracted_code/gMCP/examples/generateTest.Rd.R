library(gMCP)


### Name: generateTest
### Title: generateTest
### Aliases: generateTest
### Keywords: htest

### ** Examples


 ## Define some graph as matrix
 g <- matrix(c(0,0,1,0,
               0,0,0,1,
               0,1,0,0,
               1,0,0,0), nrow = 4,byrow=TRUE)
 ## Choose weights
 w <- c(.5,.5,0,0)
 ## Some correlation (upper and lower first diagonal 1/2)
 c <- diag(4)
 c[1:2,3:4] <- NA
 c[3:4,1:2] <- NA
 c[1,2] <- 1/2
 c[2,1] <- 1/2
 c[3,4] <- 1/2
 c[4,3] <- 1/2

 ## Test function for further use:
 myTest <- generateTest(g,w,c,.05)
 myTest(c(3,2,1,2))




