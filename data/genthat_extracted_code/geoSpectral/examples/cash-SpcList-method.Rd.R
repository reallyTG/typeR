library(geoSpectral)


### Name: $,SpcList-method
### Title: Extract or replace parts of a 'SpcList' object
### Aliases: $,SpcList-method

### ** Examples

  sp<-spc.example_spectra()
  BL = spc.makeSpcList(sp,"STATION")
  
  #Extract station 394 (returns Spectra object)
  BL$`394`
  
  BL@by="CRUISE"
  BL[[1]]$CRUISE="Cruise1"
  BL[[2]]$CRUISE="Cruise2"
  BL[[3]]$CRUISE="Cruise3"
  BL[[4]]$CRUISE="Cruise4"
  names(BL)
  BL$Cruise4




