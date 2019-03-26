library(matlib)


### Name: printMatEqn
### Title: Print Matrices or Matrix Operations Side by Side
### Aliases: printMatEqn

### ** Examples


A <- matrix(c(2, 1, -1,
             -3, -1, 2,
             -2,  1, 2), 3, 3, byrow=TRUE)
x <- c(2, 3, -1)

# provide implicit or explicit labels
printMatEqn(AA = A, "*", xx = x, '=', b = A %*% x)
printMatEqn(A, "*", x, '=', b = A %*% x)
printMatEqn(A, "*", x, '=', A %*% x)

# compare with showEqn
b <- c(4, 2, 1)
printMatEqn(A, x=paste0("x", 1:3),"=", b)
showEqn(A, b)

# decimal example
A <- matrix(c(0.5, 1, 3, 0.75, 2.8, 4), nrow = 2)
x <- c(0.5, 3.7, 2.3)
y <- c(0.7, -1.2)
b <- A %*% x - y

printMatEqn(A, "*", x, "-", y, "=", b)
printMatEqn(A, "*", x, "-", y, "=", b, fractions=TRUE)




