library(activpalProcessing)


### Name: prolonged.sed.bouts.num
### Title: Estimate The Number of Prolonged Sedentary Bouts
### Aliases: prolonged.sed.bouts.num
### Keywords: sitting sedentary

### ** Examples

data(second.by.second.data)
posture <- second.by.second.data$ap.posture

# estimate number of sedentary bouts lasting at least 60 minutes 
prolonged.sed.bouts.num(posture,epoch=1,n=60) 




