library(Renvlp)


### Name: boot.senv
### Title: Bootstrap for senv
### Aliases: boot.senv

### ** Examples

data(sales)
X <- sales[, 1:3]
Y <- sales[, 4:7]

u <- u.senv(X, Y)
u

## Not run: B <- 100
## Not run: bootse <- boot.senv(X, Y, 2, B)
## Not run: bootse



