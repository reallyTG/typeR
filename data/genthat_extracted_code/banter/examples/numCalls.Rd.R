library(banter)


### Name: numCalls
### Title: Number and Proportion of Calls
### Aliases: numCalls propCalls

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

# number of calls by species and event
numCalls(bant.mdl, "species")
numCalls(bant.mdl, "event")

# proportion of calls by species and event
propCalls(bant.mdl, "species")
propCalls(bant.mdl, "event")




