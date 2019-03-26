library(Renvlp)


### Name: boot.stenv
### Title: Bootstrap for stenv
### Aliases: boot.stenv

### ** Examples

data(fiberpaper)
X <- fiberpaper[, 5:7]
Y <- fiberpaper[, 1:4]
u <- u.stenv(X, Y)
u

B <- 100
bootse <- boot.stenv(X, Y, 2, 3, B)
bootse



