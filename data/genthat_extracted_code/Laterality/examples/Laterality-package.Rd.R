library(Laterality)


### Name: Laterality-package
### Title: Laterality
### Aliases: Laterality-package Laterality
### Keywords: HI handedness index zscore laterality manual preference
###   correspondence AFCM MCA

### ** Examples

  ### later function ###
  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  later(Data, catch ="Food", indiv="Indiv", hand="Hand", 
  RightHand="R", LeftHand="L", savetable = FALSE)
  ## or
  later(Data)
  
  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  later(Data, catch ="Act", indiv="Individual", hand="HandPref",
  RightHand="Right", LeftHand="Left", savetable = FALSE)
  
  ### HIndiv function ###
  ## With arguments corresponding to the default ones:
  str(laterdata)
  Data<-laterdata
  HIndiv(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L", legendlocation=FALSE, legend.text=TRUE)
  ## or
  HIndiv(Data, legendlocation=FALSE, legend.text=TRUE)
  
  ## With arguments different from the default ones:
  str(lateradata)
  Data<-lateradata
  HIndiv(Data, catch="Act", hand="HandPref", indiv = "Individual", 
  RightHand = "Right", LeftHand = "Left", legendlocation=FALSE, legend.text=TRUE)
  
  ### HImeanact function ###
  ## With arguments corresponding to the default ones:
  str(laterdata)
  Data<-laterdata
  HImeanact(Data, catch="Food", hand="Hand", indiv = "Indiv", 
  RightHand = "R", LeftHand = "L")
  ## or
  HImeanact(Data)
  
  ## With arguments different from the default ones:
  str(lateradata)
  Data<-lateradata
  HImeanact(Data, catch="Act", hand="HandPref", indiv = "Individual",
  RightHand = "Right", LeftHand = "Left")



