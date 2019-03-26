library(nimble)


### Name: nimSvd
### Title: Singular Value Decomposition of a Matrix
### Aliases: nimSvd svd

### ** Examples

 singularValuesDemoFunction <- nimbleFunction(
   setup = function(){
     demoMatrix <- diag(4) + 2
   },
   run = function(){
     singularValues <- svd(demoMatrix)$d
     returnType(double(1))
     return(singularValues)
 })



