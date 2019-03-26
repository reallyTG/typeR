library(RHPCBenchmark)


### Name: DeterminantMicrobenchmark
### Title: Conducts a single performance trial with the matrix determinant
###   dense matrix kernel
### Aliases: DeterminantMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix determinant microbenchmark for the first
##D # matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- DeterminantAllocator(microbenchmarks[["determinant"]], 1)
##D # Execute the microbenchmark
##D timings <- DeterminantMicrobenchmark(microbenchmarks[["determinant"]], kernelParameters)
## End(Not run)




