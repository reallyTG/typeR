library(devRate)


### Name: devRateFind
### Title: Find models for species
### Aliases: devRateFind

### ** Examples

devRateFind(orderSP = "Lepidoptera")
devRateFind(familySP = "Gelechiidae")
## detailed example:
devRateFind(species = "Tuta absoluta")
## campbell_74 model has been used for T. absoluta
## Parameters from the campbell equation can be accessed by:
## campbell_74$startVal[campbell_74$startVal["genSp"] == "Tuta absoluta",]



