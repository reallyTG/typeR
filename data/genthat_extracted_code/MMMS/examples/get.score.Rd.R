library(MMMS)


### Name: get.score
### Title: Calculation of composite scores based on an interaction model
### Aliases: get.score

### ** Examples

  # load the dataset
  data(simdat)
  attach(simdat)
  
  # get composite scores using an interaction model
  score = get.score(time,event,treat,bio,covar,nfolds=5,alpha=0.5,
                    pos.direction=FALSE)



