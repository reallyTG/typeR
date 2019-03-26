library(lambda.tools)


### Name: foldblock
### Title: Successively apply a function to adjacent blocks of a sequence
### Aliases: foldblock

### ** Examples

# Sum 5 2 x 2 matrices
ms <- matrix(sample(40,20, replace=TRUE), nrow=2)
foldblock(ms,2, function(a,b) a + b)

# 1D foldblock is equivalent to 2D fold
x <- 1:12
f <- function(a,b) mean(a) + b
foldblock(x,3,f) == fold(matrix(x, nrow=3),f, 0)




