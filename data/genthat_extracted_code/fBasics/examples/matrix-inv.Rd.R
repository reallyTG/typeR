library(fBasics)


### Name: inv
### Title: The Inverse of a Matrix
### Aliases: inv
### Keywords: math

### ** Examples

## Create Pascal Matrix:
   P = pascal(5)
   P
         
## Compute the Inverse Matrix:
   inv(P)
   
## Check:
   inv(P) 
   
## Alternatives:
   chol2inv(chol(P))
   solve(P)                     



