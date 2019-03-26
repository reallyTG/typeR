library(RHPCBenchmark)


### Name: LsfitMicrobenchmark
### Title: Conducts a single performance trial with the matrix least
###   squares fit dense matrix kernel
### Aliases: LsfitMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the least-squares fit microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- LsfitAllocator(microbenchmarks[["lsfit"]], 1)
##D # Execute the microbenchmark
##D timings <- LsfitMicrobenchmark(microbenchmarks[["lsfit"]], kernelParameters)
## End(Not run)




