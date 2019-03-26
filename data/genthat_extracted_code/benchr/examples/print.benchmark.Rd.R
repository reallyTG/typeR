library(benchr)


### Name: print.benchmark
### Title: Print method for the 'benchmark' timings.
### Aliases: print.benchmark print.summaryBenchmark

### ** Examples

a1 <- a2 <- a3 <- a4 <- numeric(0)
res <- benchmark(a1 <- c(a1, 1),
                 a2 <- append(a2, 1),
                 a3[length(a3) + 1] <- 1,
                 a4[[length(a4) + 1]] <- 1)
print(res)




