library(AcrossTic)


### Name: plot.AcrossTic
### Title: Plot function for simple AcrossTic objects
### Aliases: plot.AcrossTic

### ** Examples

set.seed (123)
X <- matrix (rnorm (100), 50, 2) # Create data...
y <- rep (c (0, 1), each=25) # ...and class membership
plot (rRegMatch (X, r = 3, y = y))



