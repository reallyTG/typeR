library(pracma)


### Name: crossn
### Title: n-dimensional Vector Cross Product
### Aliases: crossn
### Keywords: array

### ** Examples

A <- matrix(c(1,0,0, 0,1,0), nrow=2, ncol=3, byrow=TRUE)
crossn(A)  #=> 0 0 1

x <- c(1.0, 0.0, 0.0)
y <- c(1.0, 0.5, 0.0)
z <- c(0.0, 0.0, 1.0)
identical(dot(x, crossn(rbind(y, z))), det(rbind(x, y, z)))



