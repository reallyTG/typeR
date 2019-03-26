library(activpalProcessing)


### Name: step.min.AP
### Title: Estimate Time Spent Stepping
### Aliases: step.min.AP
### Keywords: steps

### ** Examples

	
data(second.by.second.data)
posture <- second.by.second.data$ap.posture
	
step.min.AP(posture,epoch=1)

# summarize by date
tapply(second.by.second.data$ap.posture, second.by.second.data$date,step.min.AP,epoch=1)




