library(meanShiftR)


### Name: meanShift
### Title: Mean shift classification
### Aliases: meanShift

### ** Examples

x <- matrix(runif(20),10,2)
classification <- meanShift(x,x)

x <- matrix(runif(20),10,2)
classification <- meanShift(x, 
algorithm="KDTREE", 
nNeighbor=8, 
parameters=c(5,7.1) )




