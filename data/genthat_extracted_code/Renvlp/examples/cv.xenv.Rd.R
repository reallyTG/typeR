library(Renvlp)


### Name: cv.xenv
### Title: Cross validation for xenv
### Aliases: cv.xenv

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 1:6]
Y <- wheatprotein[, 7]

m <- 5
nperm <- 50
## Not run: cvPE <- cv.xenv(X, Y, 2, m, nperm)
## Not run: cvPE



