library(networkTomography)


### Name: gravity.fit
### Title: Gravity estimation for a single time point
### Aliases: gravity.fit
### Keywords: models multivariate ts

### ** Examples

data(cmu)
srcDstInd <- getSrcDstIndices(cmu$A.full)
estimate <- gravity.fit(yt=cmu$Y.full[1,], srcDstInd=srcDstInd)



