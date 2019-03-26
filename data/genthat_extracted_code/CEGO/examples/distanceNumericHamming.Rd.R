library(CEGO)


### Name: distanceNumericHamming
### Title: Hamming Distance for Vectors
### Aliases: distanceNumericHamming

### ** Examples

#e.g., used for distance between bit strings
x <- c(0,1,0,1,0)
y <- c(1,1,0,0,1)
distanceNumericHamming(x,y)
p <- replicate(10,sample(c(0,1),5,replace=TRUE),simplify=FALSE)
distanceMatrix(p,distanceNumericHamming)




