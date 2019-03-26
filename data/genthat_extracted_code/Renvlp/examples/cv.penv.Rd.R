library(Renvlp)


### Name: cv.penv
### Title: Cross validation for penv
### Aliases: cv.penv

### ** Examples

data(fiberpaper)
X1 <- fiberpaper[, 7]
X2 <- fiberpaper[, 5:6]
Y <- fiberpaper[, 1:4]

m <- 5
nperm <- 50
cvPE <- cv.penv(X1, X2, Y, 1, m, nperm)
cvPE



