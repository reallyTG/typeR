library(Laterality)


### Name: later
### Title: later: this function calculates handedness index (HI) and
###   z-score.
### Aliases: later
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  later(Data, catch ="Food", indiv="Indiv", hand="Hand", 
  RightHand="R", LeftHand="L", savetable = FALSE, file = "HIz.csv")
  ## or
  later(Data)
  
  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  later(Data, catch ="Act", indiv="Individual", hand="HandPref", 
  RightHand="Right", LeftHand="Left", savetable = FALSE, 
  file = "HIz.csv")



