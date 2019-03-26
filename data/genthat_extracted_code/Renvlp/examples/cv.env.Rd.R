library(Renvlp)


### Name: cv.env
### Title: Cross validation for env
### Aliases: cv.env

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 8]
Y <- wheatprotein[, 1:6]
u <- u.env(X, Y)
u

m <- 5
nperm <- 50
cvPE <- cv.env(X, Y, 1, m, nperm)
cvPE



