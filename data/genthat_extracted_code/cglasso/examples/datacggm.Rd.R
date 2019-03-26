library(cglasso)


### Name: datacggm
### Title: Create a Dataset from a Censored Gaussian Graphical Model
### Aliases: datacggm [.datacggm dimnames.datacggm dimnames<-.datacggm
###   is.datacggm print.datacggm dim.datacggm as.matrix.datacggm
### Keywords: datagen multivariate

### ** Examples

set.seed(123)
library("cglasso")

# a dataset from a left-censored Gaussian graphical model
n <- 100L
p <- 5L
X <- matrix(rnorm(n * p), n, p)
lo <- -1
X[X <= lo] <- lo
X <- datacggm(X, lo = lo)
X
as.matrix(X)

# a dataset from a right-censored Gaussian graphical model
n <- 100L
p <- 5L
X <- matrix(rnorm(n * p), n, p)
up <- 1
X[X >= up] <- up
X <- datacggm(X, up = up)
X
as.matrix(X)

# a dataset from a censored Gaussian graphical model
n <- 100L
p <- 5L
X <- matrix(rnorm(n * p), n, p)
up <- 1
lo <- -1
X[X >= up] <- up
X[X <= lo] <- lo
X <- datacggm(X, lo = lo, up = up)
X
as.matrix(X)



