library(tilting)


### Name: tilting-package
### Title: Variable Selection via Tilted Correlation Screening Algorithm
### Aliases: tilting-package

### ** Examples


X <- matrix(rnorm(100*100), 100, 100) # 100-by-100 design matrix
y <- apply(X[,1:5], 1, sum)+rnorm(100) # first five variables are significant

tilt <- tilting(X, y, op=2)
tilt$active.hat # returns the finally selected variables




