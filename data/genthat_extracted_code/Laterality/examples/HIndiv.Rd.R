library(Laterality)


### Name: HIndiv
### Title: HIndiv: this function calculates the Handedness Index of each
###   individual for each activity and plots the corresponding histogram.
### Aliases: HIndiv
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  HIndiv(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L", legendlocation=FALSE, legend.text=TRUE)
  ## or
  HIndiv(Data, legendlocation=FALSE, legend.text=TRUE)

  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  HIndiv(Data, catch="Act", hand="HandPref", indiv = "Individual", 
  RightHand = "Right", LeftHand = "Left", legendlocation=FALSE, legend.text=TRUE)



