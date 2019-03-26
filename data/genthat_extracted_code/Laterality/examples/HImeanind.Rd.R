library(Laterality)


### Name: HImeanind
### Title: HImeanind: this function calculates the mean Handedness Index of
###   each individual.
### Aliases: HImeanind
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  HImeanind(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L", horiz = FALSE)
  ## or
  HImeanind(Data, horiz = FALSE)

  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  HImeanind(Data, catch="Act", hand="HandPref", indiv = "Individual", 
  RightHand = "Right",   LeftHand = "Left", horiz = FALSE)



