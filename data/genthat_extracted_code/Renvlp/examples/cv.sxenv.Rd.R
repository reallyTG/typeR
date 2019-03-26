library(Renvlp)


### Name: cv.sxenv
### Title: Cross validation for sxenv
### Aliases: cv.sxenv

### ** Examples

data(sales)
Y <- sales[, 1:3]
X <- sales[, 4:7]
R <- rep(1, 4)

m <- 5
nperm <- 50
## Not run: cvPE <- cv.sxenv(X, Y, 2, R, m, nperm)
## Not run: cvPE



