library(quanteda)


### Name: influence.predict.textmodel_affinity
### Title: Compute feature influence from a predicted textmodel_affinity
###   object
### Aliases: influence.predict.textmodel_affinity
### Keywords: internal textmodel

### ** Examples

af <- textmodel_affinity(data_dfm_lbgexample, y = c("L", NA, NA, NA, "R", NA))
afpred <- predict(af) 
influence(afpred)



