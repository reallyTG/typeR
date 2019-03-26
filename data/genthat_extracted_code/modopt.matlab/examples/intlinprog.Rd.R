library(modopt.matlab)


### Name: intlinprog
### Title: MatLab(R)-style Mixed Integer Linear Programming in R using ROI
### Aliases: intlinprog

### ** Examples

# minimize 8x1 + x2
# subject to
#   x1 + 2x2 >= -14
#   -4x1 - 1x2 <= -33
#   2x1 + x2 <= 20
#   x1, x2 integer

f <- c(8, 1)
A <- matrix(c(-1, -2, -4, -1, 2, 1), nrow=3, byrow=TRUE)
b <- c(14, -33, 20)

sol <- intlinprog(f, c(1, 2), A, b)
sol <- intlinprog(f, NULL, A, b)

sol$x




