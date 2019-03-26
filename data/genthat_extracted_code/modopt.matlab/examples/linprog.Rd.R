library(modopt.matlab)


### Name: linprog
### Title: MatLab(R)-style Linear Programming in R using ROI
### Aliases: linprog

### ** Examples

# maximize: 2x1 + x2
# subject to: 
#   x1 + x2 <= 5
#   x1 <= 3
#   x1 >= 0, x2 >= 0

f <- c(2, 1)
A <- matrix(c(1, 1, 1, 0), nrow=2, byrow=TRUE)
b <- c(5, 3)

sol <- linprog(-f, A, b)
sol$x




