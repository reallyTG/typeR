library(microbenchmark)


### Name: print.microbenchmark
### Title: Print 'microbenchmark' timings.
### Aliases: print.microbenchmark

### ** Examples

a1 <- a2 <- a3 <- a4 <- numeric(0)

res <- microbenchmark(a1 <- c(a1, 1),
                      a2 <- append(a2, 1),
                      a3[length(a3) + 1] <- 1,
                      a4[[length(a4) + 1]] <- 1,
                      times=100L)
print(res)
## Change default unit to relative runtime
options(microbenchmark.unit="relative")
print(res)
## Change default unit to evaluations per second
options(microbenchmark.unit="eps")
print(res)




