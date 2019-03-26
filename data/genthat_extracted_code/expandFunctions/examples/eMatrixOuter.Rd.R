library(expandFunctions)


### Name: eMatrixOuter
### Title: Extends eOuter to allow a matrix for the first argument
### Aliases: eMatrixOuter

### ** Examples

A <- matrix(1:6,ncol=2)
temp <- eMatrixOuter(A,0:2,FUN=`^`)



