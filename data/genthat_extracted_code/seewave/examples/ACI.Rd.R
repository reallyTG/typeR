library(seewave)


### Name: ACI
### Title: Acoustic Complexity Index
### Aliases: ACI
### Keywords: ts

### ** Examples

data(tico)
ACI(tico)
## dividing the sound sample into 4 windows of equal duration
ACI(tico, nbwindows=4)
## selection of a frequency band
ACI(tico, flim=c(2,6))



