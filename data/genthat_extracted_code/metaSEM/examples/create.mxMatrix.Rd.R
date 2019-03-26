library(metaSEM)


### Name: create.mxMatrix
### Title: Create a Vector into MxMatrix-class
### Aliases: create.mxMatrix
### Keywords: utilities

### ** Examples

## a and b are free parameters with starting values and labels
(a1 <- c(1:4, "5*a", 6, "7*b", 8, 9))

(mat1 <- create.mxMatrix(a1, ncol=3, nrow=3, name="mat1"))

## Arrange the elements by row
(mat2 <- create.mxMatrix(a1, ncol=3, nrow=3, as.mxMatrix=FALSE, byrow=TRUE))

(a3 <- c(1:3, "4*f4", "5*f5", "6*f6"))

(mat3 <- create.mxMatrix(a3, type="Symm", name="mat3"))

## Create character matrix
(mat4 <- create.mxMatrix(a3, type="Symm", as.mxMatrix=FALSE))

## Arrange the elements by row
(mat5 <- create.mxMatrix(a3, type="Symm", as.mxMatrix=FALSE, byrow=TRUE))

(mat6 <- create.mxMatrix(a3, type="Diag", lbound=6:1, name="mat6"))



