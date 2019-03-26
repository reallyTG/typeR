library(RHPCBenchmark)


### Name: SvdMicrobenchmark
### Title: Conducts a single performance trial with the singular value
###   decomposition (SVD) dense matrix kernel
### Aliases: SvdMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the singular value decomposition microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- SvdAllocator(microbenchmarks[["svd"]], 1)
##D # Execute the microbenchmark
##D timings <- SvdMicrobenchmark(microbenchmarks[["svd"]], kernelParameters)
## End(Not run)




