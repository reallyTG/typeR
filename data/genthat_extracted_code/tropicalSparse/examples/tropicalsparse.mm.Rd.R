library(tropicalSparse)


### Name: tropicalsparse.mm
### Title: tropicalsparse.mm()
### Aliases: tropicalsparse.mm

### ** Examples

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 10, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

b <- matrix(data = c(Inf, Inf, 4, Inf, -0.3, Inf, Inf, 2, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

c <- matrix(data = c(1, Inf, Inf, Inf, 0, 6, Inf, Inf, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

tropicalsparse.mm(A = a, alpha = 5, opB = TRUE, B = b, C = c,
store = 'csr', algebraType = 'minplus')

#      [,1] [,2] [,3]
# [1,]    1  Inf  Inf
# [2,]  Inf  0.0    6
# [3,]  Inf 14.7   17




