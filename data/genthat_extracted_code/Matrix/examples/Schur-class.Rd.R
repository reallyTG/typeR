library(Matrix)


### Name: Schur-class
### Title: Class "Schur" of Schur Matrix Factorizations
### Aliases: Schur-class
### Keywords: classes

### ** Examples

showClass("Schur")
Schur(M <- Matrix(c(1:7, 10:2), 4,4))
## Trivial, of course:
str(Schur(Diagonal(5)))

## for more examples, see Schur()



