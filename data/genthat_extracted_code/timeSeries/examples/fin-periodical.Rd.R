library(timeSeries)


### Name: periodical
### Title: End-of-Period Series, Stats, and Benchmarks
### Aliases: endOfPeriod endOfPeriodSeries endOfPeriodStats
###   endOfPeriodBenchmarks
### Keywords: chron

### ** Examples

## Load Series: Column 1:3 Swiss Market, Column 8 (4) Benchmark
   x <- 100 * LPP2005REC[, c(1:3, 8)]
   colnames(x)
   x <- daily2monthly(x)
   x
   
## Get the Monthly Series - 
   endOfPeriodSeries(x, nYearsBack="1y")
   
## Compute the Monthly Statistics - 
   endOfPeriodStats(x, nYearsBack="1y")
   
## Compute the Benchmark - 
   endOfPeriodBenchmarks(x, benchmark=4) 



