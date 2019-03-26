library(Renvlp)


### Name: boot.penv
### Title: Bootstrap for penv
### Aliases: boot.penv

### ** Examples

data(fiberpaper)
X1 <- fiberpaper[, 7]
X2 <- fiberpaper[, 5:6]
Y <- fiberpaper[, 1:4]

B <- 100
bootse <- boot.penv(X1, X2, Y, 1, B)
bootse



