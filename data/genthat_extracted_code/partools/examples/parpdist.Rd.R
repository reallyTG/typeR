library(partools)


### Name: parpdist
### Title: Partools Apps
### Aliases: parpdist

### ** Examples

# set up 'parallel' cluster
cls <- makeCluster(2)
setclsinfo(cls)

x <- matrix(runif(20),nrow=5)
y <- matrix(runif(32),nrow=8)
# 2 calls should have identical resultsW
pdist(x,y,cls)@dist
parpdist(x,y,cls)@dist

stopCluster(cls)




