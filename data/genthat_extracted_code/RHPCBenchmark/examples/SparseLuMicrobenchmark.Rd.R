library(RHPCBenchmark)


### Name: SparseLuMicrobenchmark
### Title: Conducts a single performance trial with the LU factorization
###   sparse matrix kernel
### Aliases: SparseLuMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the LU factorization microbenchmark for the
##D # circuit5M_dc matrix
##D microbenchmarks <- GetSparseLuDefaultMicrobenchmarks()
##D kernelParameters <- SparseLuAllocator(microbenchmarks[["lu_circuit5M_dc"]], 1)
##D # Execute the microbenchmark
##D timings <- SparseLuMicrobenchmark(
##D    microbenchmarks[["lu_circuit5M_dc"]], kernelParameters)
## End(Not run)




