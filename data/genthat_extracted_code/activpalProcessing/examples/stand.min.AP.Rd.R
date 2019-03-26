library(activpalProcessing)


### Name: stand.min.AP
### Title: Estimate Time Spent Standing
### Aliases: stand.min.AP
### Keywords: upright

### ** Examples

data(second.by.second.data)
posture <- second.by.second.data$ap.posture
	
stand.min.AP(posture,epoch=1)

# summarize by date
tapply(second.by.second.data$ap.posture, second.by.second.data$date, stand.min.AP,epoch=1)




