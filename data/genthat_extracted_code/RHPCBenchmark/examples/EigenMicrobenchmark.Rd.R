library(RHPCBenchmark)


### Name: EigenMicrobenchmark
### Title: Conducts a single performance trial with the matrix
###   eigendecomposition dense matrix kernel
### Aliases: EigenMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix eigendecomposition microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- EigenAllocator(microbenchmarks[["eigen"]], 1)
##D # Execute the microbenchmark
##D timings <- EigenMicrobenchmark(microbenchmarks[["eigen"]], kernelParameters)
## End(Not run)




