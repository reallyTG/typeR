library(RHPCBenchmark)


### Name: SolveMicrobenchmark
### Title: Conducts a single performance trial with the dense matrix kernel
###   for computing the solution to a system of linear equations with
###   multiple right-hand sides
### Aliases: SolveMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the linear solve microbenchmark for the
##D # first matrix size to be tested
##D microbenchmarks <- GetDenseMatrixDefaultMicrobenchmarks()
##D kernelParameters <- SolveAllocator(microbenchmarks[["solve"]], 1)
##D # Execute the microbenchmark
##D timings <- SolveMicrobenchmark(microbenchmarks[["solve"]], kernelParameters)
## End(Not run)




