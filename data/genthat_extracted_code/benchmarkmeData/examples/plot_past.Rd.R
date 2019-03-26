library(benchmarkmeData)


### Name: plot_past
### Title: Scatter plot of past benchmarks
### Aliases: plot_past

### ** Examples

## Plot non byte optimize code
plot_past("prog", byte_optimize=FALSE)
## Plot all past results for the `prog` benchmark
plot_past("prog")

## Plot the blas_optimized results
plot_past("prog", blas_optimize=TRUE)



