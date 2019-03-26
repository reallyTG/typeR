library(RHPCBenchmark)


### Name: MatmatMicrobenchmark
### Title: Conducts a single performance trial with the matrix-matrix
###   multiplication dense matrix kernel
### Aliases: MatmatMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix-matrix multiplication microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- MatmatAllocator(microbenchmarks[["matmat"]], 1)
##D # Execute the microbenchmark
##D timings <- MatmatMicrobenchmark(microbenchmarks[["matmat"]], kernelParameters)
## End(Not run)




