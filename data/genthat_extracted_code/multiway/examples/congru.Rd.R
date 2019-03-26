library(multiway)


### Name: congru
### Title: Tucker's Congruence Coefficient
### Aliases: congru
### Keywords: array algebra

### ** Examples

##########   EXAMPLE 1   ##########

set.seed(1)
A <- rnorm(100)
B <- rnorm(100)
C <- A*5
D <- A*(-0.5)
congru(A,B)
congru(A,C)
congru(A,D)



##########   EXAMPLE 2   ##########

set.seed(1)
A <- cbind(rnorm(20),rnorm(20))
B <- cbind(A[,1]*-0.5,rnorm(20))
congru(A)
congru(A,B)




