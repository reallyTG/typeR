library(banter)


### Name: getBanterModel
### Title: Extract Random Forest Model
### Aliases: getBanterModel

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

# extract the event randomForest model
library(randomForest)
event.rf <- getBanterModel(bant.mdl)
event.rf

# extract the burst pulse (bp) detector model
bp.rf <- getBanterModel(bant.mdl, "bp")
bp.rf




