library(activpalProcessing)


### Name: guideline.bouts.min
### Title: Estimate Minutes Spent in Bouts of Activity that Qualify Towards
###   Meeting the Physical Activity Guidelines
### Aliases: guideline.bouts.min
### Keywords: activity mvpa

### ** Examples

data(second.by.second)
mets <- second.by.second.data$mets	

guideline.bouts.min(mets)

# summarize by date
tapply(second.by.second.data$mets, second.by.second.data$date, guideline.bouts.min)




