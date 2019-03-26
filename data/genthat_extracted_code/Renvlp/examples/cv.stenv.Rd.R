library(Renvlp)


### Name: cv.stenv
### Title: Cross validation for stenv
### Aliases: cv.stenv

### ** Examples

data(fiberpaper)
X <- fiberpaper[, 5:7]
Y <- fiberpaper[, 1:4]

m <- 5
nperm <- 50
## Not run: cvPE <- cv.stenv(X, Y, 2, 3, m, nperm)
## Not run: cvPE



