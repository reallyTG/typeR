library(tropicalSparse)


### Name: tropicalsparse.mv
### Title: tropicalsparse.mv()
### Aliases: tropicalsparse.mv

### ** Examples

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 10, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

b <- c(2, Inf, 5)

c <- c(Inf, 9, Inf)

tropicalsparse.mv(A = a, alpha = 5, opA = TRUE, x = b, y = c,
store = 'csr', algebraType = 'minplus')

#      [,1] [,2] [,3]
# [1,]    9  Inf  Inf
# [2,]    9    9    9
# [3,]  Inf   20  Inf




