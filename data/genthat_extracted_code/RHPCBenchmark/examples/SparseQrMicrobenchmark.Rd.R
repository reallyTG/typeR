library(RHPCBenchmark)


### Name: SparseQrMicrobenchmark
### Title: Conducts a single performance trial with the QR factorization
###   sparse matrix kernel
### Aliases: SparseQrMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the QR factorization microbenchmark for the
##D # Maragal_6 matrix
##D microbenchmarks <- GetSparseQrDefaultMicrobenchmarks()
##D kernelParameters <- SparseQrAllocator(microbenchmarks[["qr_Maragal_6"]], 1)
##D # Execute the microbenchmark
##D timings <- SparseQrMicrobenchmark(
##D    microbenchmarks[["qr_Maragal_6"]], kernelParameters)
## End(Not run)




