library(pracma)


### Name: inv
### Title: Matrix Inverse (Matlab Style)
### Aliases: inv
### Keywords: array

### ** Examples

A <- hilb(6)
B <- inv(A)
B
# Compute the inverse matrix through Cramer's rule:
n <- nrow(A)
detA <- det(A) 
b <- matrix(NA, nrow = n, ncol = n)
for (i in 1:n) {
    for (j in 1:n) {
        b[i, j] <- (-1)^(i+j) * det(A[-j, -i]) / detA
    }
}
b



