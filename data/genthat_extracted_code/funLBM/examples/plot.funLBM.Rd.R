library(funLBM)


### Name: plot.funLBM
### Title: Plotting co-clustering results of funLBM
### Aliases: plot.funLBM

### ** Examples

## Co-clustering of the Velib data
X = simulateData(n = 30, p = 30, t = 15)
out = funLBM(X$data,K=4,L=3)

# Visualization of results
plot(out,type='blocks')
plot(out,type='proportions')
plot(out,type='means')



