library(expandFunctions)


### Name: eReplace
### Title: Replace values in an R object coerible to a matrix
### Aliases: eReplace

### ** Examples

A <- matrix(1:6,ncol=2)
A <- eReplace(A,1,NA)
A <- eReplace(A,NA,-9999)
A <- eReplace(A,-9999,0)



