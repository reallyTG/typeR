library(Renvlp)


### Name: boot.xenv
### Title: Bootstrap for xenv
### Aliases: boot.xenv

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 1:6]
Y <- wheatprotein[, 7]

B <- 100
## Not run: bootse <- boot.xenv(X, Y, 2, B)
## Not run: bootse



