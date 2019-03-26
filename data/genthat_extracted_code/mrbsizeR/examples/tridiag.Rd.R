library(mrbsizeR)


### Name: tridiag
### Title: Generate a tridiagonal matrix.
### Aliases: tridiag

### ** Examples

set.seed(987)
mainDiag <- sample(100:110, size = 6, replace = TRUE)
upperDiag <- sample(10:20, size = 5, replace = TRUE)
lowerDiag <- sample(1:10, size = 5, replace = TRUE)

tridiag(mainDiag, upperDiag, lowerDiag)  
 



