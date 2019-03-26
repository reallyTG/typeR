library(banter)


### Name: getDetectorNames
### Title: Detector Names
### Aliases: getDetectorNames

### ** Examples

data(train.data)
# initialize BANTER model with event data
bant.mdl <- initBanterModel(train.data$events)
# add all detector models
bant.mdl <- addBanterDetector(
  bant.mdl, train.data$detectors, 
  ntree = 50, sampsize = 1, num.cores = 1
)
getDetectorNames(bant.mdl)




