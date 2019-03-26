library(AcrossTic)


### Name: rRegMatch
### Title: Regular matching with minimum-cost spanning subgraphs
### Aliases: rRegMatch

### ** Examples

set.seed (123)
X <- matrix (rnorm (100), 50, 2) # Create data...
y <- rep (c (1, 2), each=25) # ...and class membership
rRegMatch (X, r = 3, y = y)
## Not run: plot (rRegMatch (X, r = 3, y = y)) # to see picture


