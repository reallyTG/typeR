library(ri)


### Name: estlate
### Title: Estimation of local average treatment effects under
###   noncompliance
### Aliases: estlate
### Keywords: estimation noncompliance

### ** Examples

y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2,4,1,1) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0)
D <- c(1,0,0,0,0,0,1,0,1,1,0,1,0,0,1,0,0,1)

cluster <- c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9)
block <- c(rep(1,4),rep(2,6),rep(3,8))
probs <- genprobexact(Z,block,cluster) # generate probability of assignment
late <- estlate(y,D,Z,prob=probs) # estimate the LATE; estimated LATE = 9
  


