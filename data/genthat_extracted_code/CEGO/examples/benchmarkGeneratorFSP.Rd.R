library(CEGO)


### Name: benchmarkGeneratorFSP
### Title: Create Flow shop Scheduling Problem (FSP) Benchmark
### Aliases: benchmarkGeneratorFSP

### ** Examples

n=10
m=4
#ceate a matrix of processing times
A <- matrix(sample(100,replace=TRUE),n,m) 
#create FSP objective function 
fun <- benchmarkGeneratorFSP(A,n,m)
#evaluate
fun(1:n)
fun(n:1)




