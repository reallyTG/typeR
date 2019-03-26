library(MMMS)


### Name: get.subgroup
### Title: Searching for a treatment-specific subgroup
### Aliases: get.subgroup

### ** Examples

  # load the dataset
  data(simdat)
  attach(simdat)
  
  # get composite scores using an interaction model
  score = get.score(time,event,treat,bio,covar,nfolds=5,alpha=0.5,
                    pos.direction=FALSE)  

  # get subgroup
  subgrp = get.subgroup(score,simdat,lb=20,ub=80)



