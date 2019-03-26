library(Renvlp)


### Name: u.penv
### Title: Select the dimension of penv
### Aliases: u.penv

### ** Examples

data(fiberpaper)
X1 <- fiberpaper[, 7]
X2 <- fiberpaper[, 5:6]
Y <- fiberpaper[, 1:4]

u <- u.penv(X1, X2, Y)
u



