library(tropicalSparse)


### Name: tropicalsparse.axpyi
### Title: tropicalsparse.axpyi()
### Aliases: tropicalsparse.axpyi

### ** Examples

a <- c(2, Inf, 5, 0, Inf, Inf, Inf, 10, Inf)
b <- c(0, 5, Inf, Inf, 12, 2, Inf, Inf, 3)
alpha <- 5

tropicalsparse.axpyi(a, alpha, b, 'minplus')

# [1]   2  10   5   0  17   7 Inf  10   8




