library(RHPCBenchmark)


### Name: SparseCholeskyMicrobenchmark
### Title: Conducts a single performance trial with the Cholesky
###   factorization sparse matrix kernel
### Aliases: SparseCholeskyMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the Cholesky factorization microbenchmark for the
##D # ct20stif matrix
##D microbenchmarks <- GetSparseCholeskyDefaultMicrobenchmarks()
##D kernelParameters <- SparseCholeskyAllocator(microbenchmarks[["cholesky_ct20stif"]], 1)
##D # Execute the microbenchmark
##D timings <- SparseCholeskyMicrobenchmark(
##D    microbenchmarks[["choleksy_ct20stif"]], kernelParameters)
## End(Not run)




