library(Matrix)


### Name: ldiMatrix-class
### Title: Class "ldiMatrix" of Diagonal Logical Matrices
### Aliases: ldiMatrix-class !,ldiMatrix-method
###   coerce,ldiMatrix,lgCMatrix-method coerce,ldiMatrix,lgTMatrix-method
### Keywords: classes

### ** Examples

(lM <- Diagonal(x = c(TRUE,FALSE,FALSE)))
str(lM)#> gory details (slots)

crossprod(lM) # numeric
(nM <- as(lM, "nMatrix"))# -> sparse (not formally ``diagonal'')
crossprod(nM) # logical sparse



