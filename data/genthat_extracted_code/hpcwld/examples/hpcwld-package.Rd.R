library(hpcwld)


### Name: hpcwld-package
### Title: Model and data for High Performance Cluster workload
### Aliases: hpcwld-package hpcwld
### Keywords: package

### ** Examples

Wld(T=rexp(1000,1), S=rexp(1000,1), round(runif(1000,1,10)), 10)
# returns the workload, delay and total cpus used 
# for a cluster with 10 CPUs and random exponential times



