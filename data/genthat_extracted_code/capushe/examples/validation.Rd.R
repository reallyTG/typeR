library(capushe)


### Name: validation
### Title: validation
### Aliases: validation validation-methods validation.capushe
###   validation.DDSE validationcapushe validationDDSE
### Keywords: models

### ** Examples

data(datapartialcapushe)
capushepartial=capushe(datapartialcapushe)
data(datavalidcapushe)
validation(capushepartial,datavalidcapushe) ## The slope heuristics should not 
## be applied for datapartialcapushe.
data(datacapushe)
plot(capushe(datacapushe))




