library(Renvlp)


### Name: boot.sxenv
### Title: Bootstrap for sxenv
### Aliases: boot.sxenv

### ** Examples

data(sales)
Y <- sales[, 1:3]
X <- sales[, 4:7]
R <- rep(1, 4)

u <- u.sxenv(X, Y, R)
u

B <- 100
## Not run: bootse <- boot.sxenv(X, Y, 2, R, B)
## Not run: bootse



