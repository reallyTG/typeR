library(activpalProcessing)


### Name: sed.min.AP
### Title: Estimate Time in Sedentary
### Aliases: sed.min.AP
### Keywords: sit sedentary

### ** Examples

	
data(second.by.second.data)
posture <- second.by.second.data$ap.posture
	
sed.min.AP(posture,epoch=1)

# summarize by date
tapply(second.by.second.data$ap.posture, second.by.second.data$date, sed.min.AP,epoch=1)



