library(funLBM)


### Name: print.funLBM
### Title: Printing co-clustering results of funLBM
### Aliases: print.funLBM

### ** Examples

## Co-clustering of the Velib data
X = simulateData(n = 30, p = 30, t = 15)
out = funLBM(X$data,K=4,L=3)
out



