library(hpcwld)


### Name: Wld
### Title: Workload of a High Performance Cluster model
### Aliases: Wld
### Keywords: ~workload ~cluster

### ** Examples

Wld(T=rexp(1000,1), S=rexp(1000,1), round(runif(1000,1,10)), 10)
# returns the workload, delay and total cpus used 
# for a cluster with 10 CPUs and random exponential times



