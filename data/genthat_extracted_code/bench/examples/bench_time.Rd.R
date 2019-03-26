library(bench)


### Name: bench_time
### Title: Human readable times
### Aliases: bench_time as_bench_time

### ** Examples

bench_time("1")
bench_time("1ns")
bench_time("1us")
bench_time("1ms")
bench_time("1s")

bench_time("100ns") < "1ms"

sum(bench_time(c("1MB", "5MB", "500KB")))



