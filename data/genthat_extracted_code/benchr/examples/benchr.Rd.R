library(benchr)


### Name: benchr
### Title: High Precise Measurement of R Expressions Execution Time
### Aliases: benchr benchr-package benchr-package

### ** Examples

# Benchmark expressions
res <- benchmark(rep(1:10, each = 10),
                 rep.int(1:10, rep.int(10, 10)))
# Aggregated statistics
mean(res)
summary(res)
# Plot results
boxplot(res)




