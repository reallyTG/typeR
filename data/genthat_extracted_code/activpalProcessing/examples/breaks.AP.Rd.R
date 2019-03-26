library(activpalProcessing)


### Name: breaks.AP
### Title: Estimate the Number of Sit to Stand Transitions
### Aliases: breaks.AP
### Keywords: breaks transitions

### ** Examples

data(second.by.second)
posture <- second.by.second.data$ap.posture	

breaks.AP(posture)

# summarize by date
tapply(second.by.second.data$ap.posture, second.by.second.data$date, breaks.AP)




