library(CEGO)


### Name: distanceNumericLCStr
### Title: Longest Common Substring for Numeric Vectors
### Aliases: distanceNumericLCStr

### ** Examples

#e.g., used for distance between bit strings
x <- c(0,1,0,1,0)
y <- c(1,1,0,0,1)
distanceNumericLCStr(x,y)
p <- replicate(10,sample(c(0,1),5,replace=TRUE),simplify=FALSE)
distanceMatrix(p,distanceNumericLCStr)




