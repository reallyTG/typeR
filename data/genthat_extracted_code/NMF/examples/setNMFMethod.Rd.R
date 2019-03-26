library(NMF)


### Name: setNMFMethod
### Title: Registering NMF Algorithms
### Aliases: nmfRegisterAlgorithm setNMFMethod

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# define/regsiter a new -- dummy -- NMF algorithm with the minimum arguments
# y: target matrix
# x: initial NMF model (i.e. the seed)
# NB: this algorithm simply return the seed unchanged
setNMFMethod('mynmf', function(y, x, ...){ x })

# check algorithm on toy data
res <- nmfCheck('mynmf')
# the NMF seed is not changed
stopifnot( nmf.equal(res, nmfCheck('mynmf', seed=res)) )



