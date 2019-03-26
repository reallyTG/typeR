library(AcrossTic)


### Name: ptest
### Title: Permutation test for AcrossTic objects
### Aliases: ptest
### Keywords: htest

### ** Examples

set.seed (123)
X <- matrix (rnorm (100), 50, 2) # Create data...
y <- rep (c ("One", "Two"), each=25) # ...and class membership
## Not run: ptest (rRegMatch (X, r = 3, y = y)) # p = .479
X[1:25,] <- X[1:25,] + 1
## Not run: ptest (rRegMatch (X, r = 3, y = y)) # p = .037



