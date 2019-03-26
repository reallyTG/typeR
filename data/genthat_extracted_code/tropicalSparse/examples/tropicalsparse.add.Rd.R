library(tropicalSparse)


### Name: tropicalsparse.add
### Title: Addition With or Without Storage Techniques
### Aliases: tropicalsparse.add

### ** Examples

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 10, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

b <- matrix(data = c(Inf, Inf, 4, Inf, -0.3, Inf, Inf, 2, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

tropicalsparse.add(a, b, 'csr', 'minplus')

#     [,1] [,2]  [,3]
# [1,]    2  Inf    4
# [2,]    0 -0.3  Inf
# [3,]  Inf  2.0  Inf

# also

a <- matrix(data = c(5, -Inf, -Inf, -Inf, -Inf, -Inf, -Inf, 10, 2),
nrow = 3, ncol = 3, byrow = TRUE)

b <- matrix(data = c(-Inf, -Inf, 3, -Inf, -0.5, -Inf, 1.1, -Inf, -Inf),
nrow = 3, ncol = 3, byrow = TRUE)

tropicalsparse.add(a, b, 'coo', 'maxplus')

#      [,1] [,2] [,3]
# [1,]  5.0 -Inf    3
# [2,] -Inf -0.5 -Inf
# [3,]  1.1 10.0    2

# also

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 2, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

b <- c(Inf, 0, 10)

tropicalsparse.add(a, b, algebraType = 'minplus')

#      [,1] [,2] [,3]
# [1,]    2  Inf  Inf
# [2,]    0    0    0
# [3,]   10    2   10




