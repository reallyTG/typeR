library(numbers)


### Name: Hermite normal form
### Title: Hermite Normal Form
### Aliases: hermiteNF

### ** Examples

n <- 4; m <- 5
A = matrix(c(
 9,  6,  0, -8,  0,
-5, -8,  0,  0,  0,
 0,  0,  0,  4,  0,
 0,  0,  0, -5,  0), n, m, byrow = TRUE)
 
Hnf <- hermiteNF(A); Hnf
# $H =  1    0    0    0    0
#       1    2    0    0    0
#      28   36   84    0    0
#     -35  -45 -105    0    0
# $U = 11   14   32    0    0
#      -7   -9  -20    0    0
#       0    0    0    1    0
#       7    9   21    0    0
#       0    0    0    0    1

r <- 3                  # r = rank(H)
H <- Hnf$H; U <- Hnf$U
all(H == A %*% U)       #=> TRUE

##  Example: Compute integer solution of A x = b
#   H = A * U, thus H * U^-1 * x = b, or H * y = b
b <- as.matrix(c(-11, -21, 16, -20))

y <- numeric(m)
y[1] <- b[1] / H[1, 1]
for (i in 2:r)
    y[i] <- (b[i] - sum(H[i, 1:(i-1)] * y[1:(i-1)])) / H[i, i]
# special solution:
xs <- U %*% y         #  1 2 0 4 0

# and the general solution is xs + U * c(0, 0, 0, a, b), or
# in other words the basis are the m-r vectors c(0,...,0, 1, ...).
# If the special solution is not integer, there are no integer solutions.



