library(benchr)


### Name: summary.benchmark
### Title: Summary method for the 'benchmark' timings.
### Aliases: summary.benchmark

### ** Examples

timings <- benchmark(
    rchisq(100, 0), rchisq(100, 1), rchisq(100, 2),
    rchisq(100, 3), rchisq(100, 5), times = 1000L)
summary(timings)




