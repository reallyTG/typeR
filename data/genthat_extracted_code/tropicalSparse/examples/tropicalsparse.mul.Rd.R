library(tropicalSparse)


### Name: tropicalsparse.mul
### Title: Multiplication With or Without Storage Techniques
### Aliases: tropicalsparse.mul

### ** Examples

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 10, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

b <- matrix(data = c(Inf, Inf, 4, Inf, -0.3, Inf, Inf, 2, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

tropicalsparse.mul(a, b, 'csr', 'minplus')

#      [,1] [,2] [,3]
# [1,]  Inf  Inf    6
# [2,]  Inf  Inf    4
# [3,]  Inf  9.7  Inf

# also

a <- matrix(data = c(5, -Inf, -Inf, -Inf, -Inf, -Inf, -Inf, 10, 2),
nrow = 3, ncol = 3, byrow = TRUE)

b <- matrix(data = c(-Inf, -Inf, 3, -Inf, 0.5, -Inf, 1.1, -Inf, -Inf),
nrow = 3, ncol = 3, byrow = TRUE)

tropicalsparse.mul(a, b, 'coo', 'maxplus')

#      [,1] [,2] [,3]
# [1,] -Inf -Inf    8
# [2,] -Inf -Inf -Inf
# [3,]  3.1 10.5 -Inf

# also

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 2, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

b <- c(Inf, 0, 10)

tropicalsparse.mul(a, b, algebraType = 'minplus')

#      [,1] [,2] [,3]
# [1,]  Inf  Inf  Inf
# [2,]    0  Inf  Inf
# [3,]  Inf   12  Inf




