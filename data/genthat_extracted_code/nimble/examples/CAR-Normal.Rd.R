library(nimble)


### Name: CAR-Normal
### Title: The CAR-Normal Distribution
### Aliases: CAR-Normal dcar_normal rcar_normal

### ** Examples

x <- c(1, 3, 3, 4)
num <- c(1, 2, 2, 1)
adj <- c(2, 1,3, 2,4, 3)
weights <- c(1, 1, 1, 1, 1, 1)
lp <- dcar_normal(x, adj, weights, num, tau = 1)



