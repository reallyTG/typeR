library(RHPCBenchmark)


### Name: CrossprodMicrobenchmark
### Title: Conducts a single performance trial with the matrix cross
###   product dense matrix kernel
### Aliases: CrossprodMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix cross product microbenchmark for the first
##D # matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- CrossprodAllocator(microbenchmarks[["crossprod"]], 1)
##D # Execute the microbenchmark
##D timings <- CrossprodMicrobenchmark(microbenchmarks[["crossprod"]], kernelParameters)
## End(Not run)




