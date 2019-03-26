library(CCAGFA)


### Name: GFApred
### Title: Predict samples of one view given the other(s)
### Aliases: GFApred CCApred

### ** Examples

  #
  # Assume we have a variable model which has been learned with
  # CCAexperiment() or CCA().
  #
  # Predict the 2nd view:
  #
  # predictedY <- CCApred(c(1,0),Y,model)$Y
  #
  # Draw some samples from the conditional distribution of the
  # first view given the second
  #
  # sampled <- CCApred(c(0,1),Y,model,sample=TRUE,nSample=10)$sam$Y
  #



