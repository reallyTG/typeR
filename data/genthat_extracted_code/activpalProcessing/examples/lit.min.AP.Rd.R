library(activpalProcessing)


### Name: lit.min.AP
### Title: Estimate Time in Light Intensity Activity
### Aliases: lit.min.AP
### Keywords: light

### ** Examples

	
data(second.by.second.data)
mets <- second.by.second.data$mets	
posture <- second.by.second.data$ap.posture
lit.min.AP(mets,posture,epoch=1)



