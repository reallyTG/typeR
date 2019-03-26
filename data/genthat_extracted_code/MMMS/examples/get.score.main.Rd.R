library(MMMS)


### Name: get.score.main
### Title: Calculation of composite scores based on a main-effect model
### Aliases: get.score.main

### ** Examples

  # load the dataset
  data(simdat)
  attach(simdat)
  
  # get composite scores using a main-effect model
  main.only=get.score.main(time,event,treat,bio,covar,nfolds=5,alpha=0.5)




