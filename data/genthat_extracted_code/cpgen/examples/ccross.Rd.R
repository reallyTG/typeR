library(cpgen)


### Name: ccross
### Title: ccross
### Aliases: ccross
### Keywords: Tools

### ** Examples


# Computing the matrix-square-root of a positive definite square matrix:
## Not run: 
##D # generate random data
##D rand_data(500,5000)
##D 
##D W <- ccross(M)
##D 
##D # this is the implementation of the matrix power-operator '%**%'
##D W_sqrt <- with(eigen(W), ccross(vectors,values**0.5))
## End(Not run)



