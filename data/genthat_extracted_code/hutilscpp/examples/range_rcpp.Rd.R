library(hutilscpp)


### Name: range_rcpp
### Title: Range C++
### Aliases: range_rcpp

### ** Examples

x <- rnorm(1e3) # Not noticeable at this scale
bench_system_time(range_rcpp(x))
bench_system_time(range(x))






