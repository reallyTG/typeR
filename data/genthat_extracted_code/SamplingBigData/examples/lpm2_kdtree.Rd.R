library(SamplingBigData)


### Name: lpm2_kdtree
### Title: Local Pivotal Method
### Aliases: lpm2_kdtree

### ** Examples



N <- 1000
n <- 100
x <- cbind( runif(N), runif(N)) 

set.seed(100)
Cprog <- proc.time()
sampled <- lpm2_kdtree( rep(n/N,N), x)
print("lpm2_kdtree running time")
print(proc.time() - Cprog) 




