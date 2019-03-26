library(banter)


### Name: getSampSize
### Title: Sample Size
### Aliases: getSampSize

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

# sample size for the event model
getSampSize(bant.mdl)

# sample size for the burst pulse (bp) detector model
getSampSize(bant.mdl, "bp")




