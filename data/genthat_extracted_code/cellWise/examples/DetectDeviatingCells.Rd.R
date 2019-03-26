library(cellWise)


### Name: DetectDeviatingCells
### Title: Detect Deviating Cells
### Aliases: DetectDeviatingCells

### ** Examples

library(MASS) 
set.seed(12345) 
n = 100; d = 10
A = matrix(0.9, d, d); diag(A) = 1
xclean = mvrnorm(n, rep(0,d), A)
DDCxclean = DetectDeviatingCells(xclean)

# For more examples, we refer to the vignette:
vignette("DDC_examples")



