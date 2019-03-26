library(networkTomography)


### Name: tomogravity.fit
### Title: Tomogravity estimation for a single time point using L-BFGS-B
### Aliases: tomogravity.fit
### Keywords: models multivariate ts

### ** Examples

data(cmu)
srcDstInd <- getSrcDstIndices(cmu$A.full)
estimate <- tomogravity.fit(yt=cmu$Y.full[1, ], A=cmu$A.full,
     srcDstInd=srcDstInd, lambda=0.01)



