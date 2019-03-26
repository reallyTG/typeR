library(GoodmanKruskal)


### Name: GKtau
### Title: Compute Goodman and Kruskal tau measure of association.
### Aliases: GKtau

### ** Examples

x <- rep(c("a", "b", "c", "d"), each = 3)
y <- rep(c("a", "b", "c", "d"), times = 3)
z <- rep(c("a", "b", "a", "c"), each = 3)
GKtau(x, y)
GKtau(x, z)
GKtau(y, z)



