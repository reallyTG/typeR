library(oce)


### Name: oceSetData
### Title: Set something in the 'data' slot of an 'oce' object
### Aliases: oceSetData

### ** Examples

data(ctd)
Tf <- swTFreeze(ctd)
ctd <- oceSetData(ctd, "freezing", Tf, list(unit=expression(degree*C), scale="ITS-90"))
feet <- swDepth(ctd) / 0.3048
ctd <- oceSetData(ctd, name="depthInFeet", value=feet, expression("feet"))
fathoms <- feet / 6
ctd <- oceSetData(ctd, "depthInFathoms", fathoms, "fathoms")



