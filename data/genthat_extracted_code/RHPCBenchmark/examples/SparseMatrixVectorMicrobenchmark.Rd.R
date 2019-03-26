library(RHPCBenchmark)


### Name: SparseMatrixVectorMicrobenchmark
### Title: Conducts a single performance trial with the matrix-vector
###   multiplication sparse matrix kernel
### Aliases: SparseMatrixVectorMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the matrix-vector microbenchmark for the first Laplacian
##D # matrix
##D microbenchmarks <- GetSparseMatrixVectorDefaultMicrobenchmarks()
##D kernelParameters <- SparseMatrixVectorAllocator(
##D    microbenchmarks[["matvec_laplacian7pt_100"]], 1)
##D # Execute the microbenchmark
##D timings <- SparseMatrixVectorMicrobenchmark(
##D    microbenchmarks[["matvec_laplacian7pt_100"]], kernelParameters)
## End(Not run)




