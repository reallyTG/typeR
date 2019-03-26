library(sdnet)


### Name: cnPredict-method
### Title: Prediction
### Aliases: cnPredict cnPredict,catNetwork-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxpars=3, numcats=3)
  ## generate a sample of size 2 and set nodes 8, 9 and 10 as not-available
  psamples <- matrix(as.integer(1+rbinom(10*2, 2, 0.4)), nrow=10)
  psamples[8, ] <- rep(NA, 2)
  psamples[9, ] <- rep(NA, 2)
  psamples[10, ] <- rep(NA, 2)
  ## make show sample rows are named after the network's nodes
  rownames(psamples) <- cnNodes(cnet)
  ## predict the values of nodes 8, 9 and 10
  newsamples <- cnPredict(object=cnet, data=psamples)



