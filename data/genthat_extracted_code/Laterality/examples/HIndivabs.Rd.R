library(Laterality)


### Name: HIndivabs
### Title: HIndivabs: this function calculates the absolute Handedness
###   Index of each individual for each activity and plots the
###   corresponding histogram.
### Aliases: HIndivabs
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  HIndivabs(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L", legendlocation=FALSE, legend.text=TRUE)
  ## or
  HIndivabs(Data, legendlocation=FALSE, legend.text=TRUE)
  

  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  HIndivabs(Data, catch="Act", hand="HandPref", indiv = "Individual", 
  RightHand = "Right",   LeftHand = "Left", legendlocation=FALSE, legend.text=TRUE)



