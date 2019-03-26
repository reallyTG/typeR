library(RHPCBenchmark)


### Name: TransposeMicrobenchmark
### Title: Conducts a single performance trial with the matrix transpose
###   dense matrix kernel
### Aliases: TransposeMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix transpose microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- TransposeAllocator(microbenchmarks[["transpose"]], 1)
##D # Execute the microbenchmark
##D timings <- TransposeMicrobenchmark(microbenchmarks[["transpose"]], kernelParameters)
## End(Not run)




