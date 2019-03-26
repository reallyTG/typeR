library(Renvlp)


### Name: cv.genv
### Title: Cross validation for genv
### Aliases: cv.genv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , c(5, 7)]
Y <- fiberpaper[ , 1:3]
Z <- as.numeric(fiberpaper[ , 6] > mean(fiberpaper[ , 6]))

m <- 5
nperm <- 50
## Not run: cvPE <- cv.genv(X, Y, Z, 2, m, nperm)
## Not run: cvPE




