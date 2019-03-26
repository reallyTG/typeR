library(cpgen)


### Name: %**%
### Title: Square matrix power operator
### Aliases: %**%
### Keywords: Tools

### ** Examples

## Not run: 
##D # Inverse Square Root of a positive definite square matrix
##D X <- matrix(rnorm(100*5000),100,1000)
##D 
##D XX <- ccross(X)
##D 
##D XX_InvSqrt <- XX %**% -0.5
##D 
##D # check result: ((XX')^-0.5 (XX')^-0.5)^-1 = XX'
##D table(round(csolve(XX_InvSqrt %c% XX_InvSqrt),digits=2) == round(XX,digits=2) )
## End(Not run)



