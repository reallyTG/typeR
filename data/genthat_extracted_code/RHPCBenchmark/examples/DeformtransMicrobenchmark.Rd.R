library(RHPCBenchmark)


### Name: DeformtransMicrobenchmark
### Title: Conducts a single performance trial with the matrix deformation
###   and transpose dense matrix kernel
### Aliases: DeformtransMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix deformation and transpose microbenchmark for
##D # the first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- DeformtransAllocator(microbenchmarks[["deformtrans"]], 1)
##D # Execute the microbenchmark
##D timings <- DeformtransMicrobenchmark(microbenchmarks[["deformtrans"]], kernelParameters)
## End(Not run)




