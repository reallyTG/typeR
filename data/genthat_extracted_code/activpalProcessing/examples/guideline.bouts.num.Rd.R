library(activpalProcessing)


### Name: guideline.bouts.num
### Title: Estimate the Number of Bouts of Activity that Qualify Towards
###   Meeting the Physical Activity Guidelines
### Aliases: guideline.bouts.num
### Keywords: activity mvpa

### ** Examples

data(second.by.second)
mets <- second.by.second.data$mets	

guideline.bouts.num(mets)

# summarize by date
tapply(second.by.second.data$mets, second.by.second.data$date, guideline.bouts.num)



