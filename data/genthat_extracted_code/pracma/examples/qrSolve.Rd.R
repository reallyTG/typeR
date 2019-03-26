library(pracma)


### Name: qrSolve
### Title: LSE Solution
### Aliases: qrSolve
### Keywords: array

### ** Examples

A <- matrix(c(0,-4,2, 6,-3,-2, 8,1,-1), 3, 3, byrow=TRUE)
b <- c(-2, -6, 7)
qrSolve(A, b)

##  Solve an overdetermined linear system of equations
A <- matrix(c(1:8,7,4,2,3,4,2,2), ncol=3, byrow=TRUE)
b <- rep(6, 5)
x <- qrSolve(A, b)
qr.solve(A, rep(6, 5)); x



