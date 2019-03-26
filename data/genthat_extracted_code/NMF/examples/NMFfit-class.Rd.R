library(NMF)


### Name: NMFfit-class
### Title: Base Class for to store Nonnegative Matrix Factorisation results
### Aliases: NMFfit NMFfit-class

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# run default NMF algorithm on a random matrix
n <- 50; r <- 3; p <- 20
V <- rmatrix(n, p)
res <- nmf(V, r)

# result class is NMFfit
class(res)
isNMFfit(res)

# show result
res

# compute summary measures
summary(res, target=V)



