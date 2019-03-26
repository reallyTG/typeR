library(banter)


### Name: addBanterDetector
### Title: Add a BANTER Detector Model
### Aliases: addBanterDetector removeBanterDetector

### ** Examples

data(train.data)
# initialize BANTER model with event data
bant.mdl <- initBanterModel(train.data$events)
# add the 'bp' (burst pulse) detector model
bant.mdl <- addBanterDetector(
  x = bant.mdl, 
  data = train.data$detectors$bp, 
  name = "bp",
  ntree = 50, sampsize = 1, num.cores = 1
)
bant.mdl

# remove the 'bp' detector model
bant.mdl <- removeBanterDetector(bant.mdl, "bp")
bant.mdl




