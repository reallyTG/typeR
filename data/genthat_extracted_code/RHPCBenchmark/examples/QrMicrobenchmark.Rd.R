library(RHPCBenchmark)


### Name: QrMicrobenchmark
### Title: Conducts a single performance trial with the QR factorization
###   dense matrix kernel
### Aliases: QrMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the QR decomposition microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- QrAllocator(microbenchmarks[["qr"]], 1)
##D # Execute the microbenchmark
##D timings <- QrMicrobenchmark(microbenchmarks[["qr"]], kernelParameters)
## End(Not run)




