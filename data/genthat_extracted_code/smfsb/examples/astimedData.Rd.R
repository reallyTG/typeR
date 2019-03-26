library(smfsb)


### Name: as.timedData
### Title: Convert a time series object to a timed data matrix
### Aliases: as.timedData
### Keywords: smfsb

### ** Examples

truth=simTs(c(x1=50,x2=100),0,20,2,stepLVc)
simData=truth+rnorm(prod(dim(truth)),0,5)
timedData=as.timedData(simData)
print(timedData)



