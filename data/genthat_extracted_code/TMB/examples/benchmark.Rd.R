library(TMB)


### Name: benchmark
### Title: Benchmark parallel templates
### Aliases: benchmark plot.parallelBenchmark

### ** Examples

## Not run: 
##D runExample("linreg_parallel",thisR=TRUE)  ## Create obj
##D ben <- benchmark(obj,n=100,cores=1:4)
##D plot(ben)
##D ben <- benchmark(obj,n=10,cores=1:4,expr=expression(do.call("optim",obj)))
##D plot(ben)
## End(Not run)



