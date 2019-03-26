library(pracma)


### Name: procrustes
### Title: Solving the Procrustes Problem
### Aliases: procrustes kabsch
### Keywords: array

### ** Examples

##  Procrustes
U <- randortho(5)               # random orthogonal matrix
P <- procrustes(U, eye(5))

##  Kabsch
P <- matrix(c(0, 1, 0, 0, 1, 1, 0, 1,
              0, 0, 1, 0, 1, 0, 1, 1,
              0, 0, 0, 1, 0, 1, 1, 1), nrow = 3, ncol = 8, byrow = TRUE)
R <- c(1, 1, 1)
phi <- pi/4
U <- matrix(c(1, 0, 0,
              0, cos(phi), -sin(phi),
              0, sin(phi),  cos(phi)), nrow = 3, ncol = 3, byrow = TRUE)

Q <- U %*% P + R
K <- kabsch(P, Q)
# K$R == R  and  K$U %*% P + c(K$R) == Q



