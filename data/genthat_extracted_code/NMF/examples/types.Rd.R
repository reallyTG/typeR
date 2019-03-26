library(NMF)


### Name: is.nmf
### Title: Testing NMF Objects
### Aliases: hasBasis hasCoef is.empty.nmf is.nmf isNMFfit is.partial.nmf

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# is.nmf
#----------
# test if an object is an NMF model, i.e. that it implements the NMF interface
is.nmf(1:4)
is.nmf('NMFstd')
is.nmf('NMFblah')
is.nmf( nmfModel(3) )
is.nmf( nmf(rmatrix(20,10), 3) )

#----------
# is.empty.nmf
#----------
# empty model
is.empty.nmf( nmfModel(3) )
# non empty models
is.empty.nmf( nmfModel(3, 10, 0) )
is.empty.nmf( rnmf(3, 10, 5) )

#----------
# isNMFfit
#----------
## Testing results of fits
# generate a random
V <- rmatrix(20, 10)

# single run -- using very low value for maxIter to speed up the example
res <- nmf(V, 3, maxIter=3L)
isNMFfit(res)

# multiple runs - keeping single fit
resm <- nmf(V, 3, nrun=3, maxIter=3L)
isNMFfit(resm)

# with a list of results
isNMFfit(list(res, resm, 'not a result'))
isNMFfit(list(res, resm, 'not a result'), recursive=FALSE)



