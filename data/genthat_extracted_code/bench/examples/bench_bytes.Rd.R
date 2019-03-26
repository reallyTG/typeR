library(bench)


### Name: bench_bytes
### Title: Human readable memory sizes
### Aliases: bench_bytes as_bench_bytes

### ** Examples

bench_bytes("1")
bench_bytes("1K")
bench_bytes("1Kb")
bench_bytes("1KiB")
bench_bytes("1MB")

bench_bytes("1KB") < "1MB"

sum(bench_bytes(c("1MB", "5MB", "500KB")))



