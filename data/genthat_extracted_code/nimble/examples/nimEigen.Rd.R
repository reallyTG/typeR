library(nimble)


### Name: nimEigen
### Title: Spectral Decomposition of a Matrix
### Aliases: eigen nimEigen

### ** Examples

eigenvaluesDemoFunction <- nimbleFunction(
   setup = function(){
     demoMatrix <- diag(4) + 2
   },
   run = function(){
     eigenvalues <- eigen(demoMatrix, symmetric = TRUE)$values
     returnType(double(1))
     return(eigenvalues)
 })




