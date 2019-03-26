library(cshapes)


### Name: distmatrix
### Title: Compute distance matrices on the CShapes dataset
### Aliases: distmatrix

### ** Examples

# Compute a matrix of minimum distances 
# for the international system on 1/1/1946
# using the Correlates of War list and the default accuracy
## Not run: wmat <- distmatrix(as.Date("1946-1-1"), type="capdist", tolerance=0.5, useGW=FALSE)

# For model estimation, our matrix should contain 
# the inverted distances
## Not run: wmat <- 1/wmat

# Fix the values along the diagonale
## Not run: diag(wmat) <- 0 



