library(banter)


### Name: getBanterModelData
### Title: Extract Random Forest Model Data
### Aliases: getBanterModelData

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

event.df <- getBanterModelData(bant.mdl)
head(event.df)




