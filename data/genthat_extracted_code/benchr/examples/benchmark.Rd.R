library(benchr)


### Name: benchmark
### Title: High Precise Measurement of R Expressions Execution Time
### Aliases: benchmark

### ** Examples

## Measure the time it takes to dispatch a simple function call
## compared to simply evaluating the constant NULL
f <- function() NULL
res <- benchmark(NULL, f(), times = 1000L)

## Print results:
print(res)

## Plot results
boxplot(res)




