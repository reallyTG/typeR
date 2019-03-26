library(networkTomography)


### Name: gravity
### Title: Run tomogravity estimation on complete time series of aggregate
###   flows
### Aliases: gravity
### Keywords: models multivariate ts

### ** Examples

data(cmu)
srcDstInd <- getSrcDstIndices(cmu$A.full)
estimate <- gravity(Y=cmu$Y[1:3,], srcDstInd=srcDstInd)



