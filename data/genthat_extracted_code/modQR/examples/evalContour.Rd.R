library(modQR)


### Name: evalContour
### Title: Evaluating Convex Polytopes
### Aliases: evalContour

### ** Examples

##- a simple example using a tilted zero-centered square 
AAMat <- rbind(c(-1,-1), c(1,-1), c(1,1), c(-1,1))
BBVec <- c(1, 1, 1, 1)
IPVec <- c(0, 0)
CST <- evalContour(AAMat, BBVec, IPVec)
print(CST)

##- computing and evaluating the 0.15-quantile contour of 199 
##random points uniformly distributed in the unit square 
##centered at zero
Tau  <- 0.15
YMat <- matrix(runif(2*199, -0.5, 0.5), 199, 2)
C <- compContourM1u(Tau, YMat)
CST <- evalContour(-C$CharST$HypMat[,1:2], -C$CharST$HypMat[,3])
print(CST)

##See also the examples ExampleA to ExampleE for some 
##more elaborate ways of computing, evaluating and 
##plotting the (regression) quantile contours.



