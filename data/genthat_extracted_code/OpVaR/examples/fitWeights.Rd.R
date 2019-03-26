library(OpVaR)


### Name: fitWeights
### Title: Fitting the weights of the body and the tail for a spliced
###   distribution
### Aliases: fitWeights

### ** Examples

    data(lossdat)
    thresh<-quantile(lossdat[[1]]$Loss, 0.9)
    w<-fitWeights(lossdat, thresh)
    
  


