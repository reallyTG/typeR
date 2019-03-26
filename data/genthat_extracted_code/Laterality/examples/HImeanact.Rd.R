library(Laterality)


### Name: HImeanact
### Title: HImeanact: this function calculates the mean Handedness Index
###   for each activity.
### Aliases: HImeanact
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  HImeanact(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L", legendlocation=FALSE)
  ## or
  HImeanact(Data)

  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  HImeanact(Data, catch="Act", hand="HandPref", indiv = "Individual", 
  RightHand = "Right",     LeftHand = "Left")



