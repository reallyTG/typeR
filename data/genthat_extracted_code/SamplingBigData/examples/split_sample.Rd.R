library(SamplingBigData)


### Name: split_sample
### Title: Split Sample
### Aliases: split_sample

### ** Examples



N <- 1000
n <- 100
runif(N)

set.seed(100)
Cprog <- proc.time()
sampled <- split_sample( rep(n/N,N))
print(proc.time() - Cprog) 




