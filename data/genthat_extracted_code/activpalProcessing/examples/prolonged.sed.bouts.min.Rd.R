library(activpalProcessing)


### Name: prolonged.sed.bouts.min
### Title: Estimate Time in Prolonged Sedentary Bouts
### Aliases: prolonged.sed.bouts.min
### Keywords: sitting

### ** Examples

data(second.by.second.data)
posture <- second.by.second.data$ap.posture

# estimates minutes spent in sedentary bouts lasting at least 60 minutes 
prolonged.sed.bouts.min(posture,epoch=1,n=60) 





