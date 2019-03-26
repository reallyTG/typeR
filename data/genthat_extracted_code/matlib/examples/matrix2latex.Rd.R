library(matlib)


### Name: matrix2latex
### Title: Convert matrix to LaTeX equation
### Aliases: matrix2latex

### ** Examples

A <- matrix(c(2, 1, -1,
             -3, -1, 2,
             -2,  1, 2), 3, 3, byrow=TRUE)
b <- c(8, -11, -3)

matrix2latex(cbind(A,b))
matrix2latex(cbind(A,b), digits = 0)
matrix2latex(cbind(A/2,b), fractions = TRUE)




