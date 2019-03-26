library(popbio)


### Name: secder
### Title: secder
### Aliases: secder
### Keywords: algebra

### ** Examples


## eigenvalue second derivatives of the US projection matrix from 1967
## with respect to infant survival

x1 <- c(0, 0.0010478, 0.0820086, 0.2884376, 0.3777064, 
  0.2647110, 0.1405144, 0.0585568, 0.0134388, 0.0003327)
x2 <- diag(c(0.9972036, 0.9983625, 0.9978063, 0.9967535, 
  0.9961039, 0.9948677, 0.9923658, 0.9885968, 0.9828676))

usa <- rbind(x1, cbind(x2,0))
sd21 <- secder(usa,2,1)
sd21




