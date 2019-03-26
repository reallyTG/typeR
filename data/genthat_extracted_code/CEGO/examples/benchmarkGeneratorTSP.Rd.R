library(CEGO)


### Name: benchmarkGeneratorTSP
### Title: Create (Asymmetric) Travelling Salesperson Problem (TSP)
###   Benchmark
### Aliases: benchmarkGeneratorTSP

### ** Examples

set.seed(1)
#create 5 random locations to be part of a tour
n=5
cities <- matrix(runif(2*n),,2)
#calculate distances between cities
cdist <- as.matrix(dist(cities))
#create objective functions (for path or cycle)
fun1 <- benchmarkGeneratorTSP(cdist, "Path") 
fun2 <- benchmarkGeneratorTSP(cdist, "Cycle") 
#evaluate
fun1(1:n)
fun1(n:1)
fun2(n:1)
fun2(1:n)




