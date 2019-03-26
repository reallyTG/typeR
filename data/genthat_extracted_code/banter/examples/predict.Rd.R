library(banter)


### Name: predict
### Title: Predict BANTER events
### Aliases: predict predict predict.banter_model predict
###   predict,banter_model-method

### ** Examples

data(train.data)
# initialize BANTER model with event data
bant.mdl <- initBanterModel(train.data$events)
# add all detector models
bant.mdl <- addBanterDetector(
  bant.mdl, train.data$detectors, 
  ntree = 50, sampsize = 2, num.cores = 1
)
# run BANTER event model
bant.mdl <- runBanterModel(bant.mdl, ntree = 1000, sampsize = 1)

# predict test data
data(test.data)
test.pred <- predict(bant.mdl, test.data)
test.pred




