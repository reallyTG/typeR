library(propagate)


### Name: bigcor
### Title: Creating very large correlation/covariance matrices
### Aliases: bigcor
### Keywords: matrix multivariate algebra

### ** Examples

## Small example to prove similarity
## to standard 'cor'. We create a matrix
## by subsetting the complete 'ff' matrix.
MAT <- matrix(rnorm(70000), ncol = 700)
COR <- bigcor(MAT, size= 500, fun = "cor")
COR <- COR[1:nrow(COR), 1:ncol(COR)]
all.equal(COR, cor(MAT)) # => TRUE

## Example for cor(x, y) with 
## y = small matrix.
MAT1 <- matrix(rnorm(50000), nrow = 10)
MAT2 <- MAT1[, 4950:5000]
COR <- cor(MAT1, MAT2)
BCOR <- bigcor(MAT1, MAT2)
BCOR <- BCOR[1:5000, 1:ncol(BCOR)] # => convert 'ff' to 'matrix'
all.equal(COR, BCOR)

## Not run: 
##D ## Create large matrix.
##D MAT <- matrix(rnorm(57500), ncol = 5750)
##D COR <- bigcor(MAT, size= 2000, fun = "cor")
##D 
##D ## Extract submatrix.
##D SUB <- COR[1:3000, 1:3000]
##D all.equal(SUB, cor(MAT[, 1:3000]))
## End(Not run)



