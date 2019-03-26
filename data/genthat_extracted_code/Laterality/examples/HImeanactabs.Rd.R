library(Laterality)


### Name: HImeanactabs
### Title: HImeanactabs: this function calculates the absolute mean
###   Handedness Index for each activity.
### Aliases: HImeanactabs
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  HImeanactabs(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L")
  ## or
  HImeanactabs(Data)

  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  HImeanactabs(Data, catch="Act", hand="HandPref", indiv = "Individual", 
  RightHand = "Right", LeftHand = "Left")



