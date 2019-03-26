library(banter)


### Name: summary
### Title: BANTER Classifier Model Summary
### Aliases: summary summary summary.banter_model summary
###   summary,banter_model-method

### ** Examples

data(train.data)
# initialize BANTER model with event data
bant.mdl <- initBanterModel(train.data$events)
# add all detector models
bant.mdl <- addBanterDetector(
  bant.mdl, train.data$detectors, 
  ntree = 50, sampsize = 1, num.cores = 1
)
# run BANTER event model
bant.mdl <- runBanterModel(bant.mdl, ntree = 1000, sampsize = 1)
summary(bant.mdl)




