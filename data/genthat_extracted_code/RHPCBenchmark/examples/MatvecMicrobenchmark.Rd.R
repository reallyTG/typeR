library(RHPCBenchmark)


### Name: MatvecMicrobenchmark
### Title: Conducts a single performance trial with the matrix-vector
###   multiplication dense matrix kernel
### Aliases: MatvecMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix-vector multiplication microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- MatvecAllocator(microbenchmarks[["matvec"]], 1)
##D # Execute the microbenchmark
##D timings <- MatvecMicrobenchmark(microbenchmarks[["matvec"]], kernelParameters)
## End(Not run)




