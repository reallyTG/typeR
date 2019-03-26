library(calibrate)


### Name: canocor
### Title: Canonical correlation analysis
### Aliases: canocor
### Keywords: multivariate

### ** Examples

set.seed(123)
X <- matrix(runif(75),ncol=3)
Y <- matrix(runif(75),ncol=3)
cca.results <- canocor(X,Y)



