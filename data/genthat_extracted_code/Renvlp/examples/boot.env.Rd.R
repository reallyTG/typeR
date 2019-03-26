library(Renvlp)


### Name: boot.env
### Title: Bootstrap for env
### Aliases: boot.env

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 8]
Y <- wheatprotein[, 1:6]

u <- u.env(X, Y)
u

B <- 100
bootse <- boot.env(X, Y, 1, B)
bootse



