library(benchr)


### Name: plot.benchmark
### Title: Plot method for the 'benchmark' timings.
### Aliases: plot.benchmark

### ** Examples

timings <- benchmark(
    rchisq(100, 0), rchisq(100, 1), rchisq(100, 2),
    rchisq(100, 3), rchisq(100, 5), times = 1000L)
plot(timings)




