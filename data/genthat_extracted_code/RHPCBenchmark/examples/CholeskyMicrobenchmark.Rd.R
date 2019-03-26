library(RHPCBenchmark)


### Name: CholeskyMicrobenchmark
### Title: Conducts a single performance trial with the Cholesky
###   factorization dense matrix kernel
### Aliases: CholeskyMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the Cholesky microbenchmark for the first matrix size
##D # to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- CholeskyAllocator(microbenchmarks[["cholesky"]], 1)
##D # Execute the microbenchmark
##D timings <- CholeskyMicrobenchmark(microbenchmarks[["cholesky"]], kernelParameters)
## End(Not run)




