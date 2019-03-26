library(Laterality)


### Name: HImeanindabs
### Title: HImeanindabs: this function calculates the absolute mean
###   Handedness Index of each individual.
### Aliases: HImeanindabs
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  HImeanindabs(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L", horiz = FALSE)
  ## or
  HImeanindabs(Data, horiz = FALSE)

  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  HImeanindabs(Data, catch="Act", hand="HandPref", indiv = "Individual", 
  RightHand = "Right",     LeftHand = "Left", horiz = FALSE)



