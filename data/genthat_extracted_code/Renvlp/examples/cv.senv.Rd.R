library(Renvlp)


### Name: cv.senv
### Title: Cross validation for senv
### Aliases: cv.senv

### ** Examples

data(sales)
X <- sales[, 1:3]
Y <- sales[, 4:7]

m <- 5
nperm <- 50
## Not run: cvPE <- cv.senv(X, Y, 2, m, nperm)
## Not run: cvPE



