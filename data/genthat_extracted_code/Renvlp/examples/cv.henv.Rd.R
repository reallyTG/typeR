library(Renvlp)


### Name: cv.henv
### Title: Cross validation for henv
### Aliases: cv.henv

### ** Examples

data(waterstrider)
X <- waterstrider[ , 1]
Y <- waterstrider[ , 2:5]

m <- 5
nperm <- 50

## Not run: cvPE <- cv.henv(X, Y, 2, m, nperm)
## Not run: cvPE



