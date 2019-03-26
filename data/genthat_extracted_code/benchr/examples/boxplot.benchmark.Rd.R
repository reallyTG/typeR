library(benchr)


### Name: boxplot.benchmark
### Title: Boxplot method for the 'benchmark' timings
### Aliases: boxplot.benchmark

### ** Examples

timings <- benchmark(
    rchisq(100, 0), rchisq(100, 1), rchisq(100, 2),
    rchisq(100, 3), rchisq(100, 5), times = 1000L)
boxplot(timings)




