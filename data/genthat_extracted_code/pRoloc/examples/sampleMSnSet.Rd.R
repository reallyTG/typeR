library(pRoloc)


### Name: sampleMSnSet
### Title: Extract a stratified sample of an 'MSnSet'
### Aliases: sampleMSnSet

### ** Examples

library(pRolocdata)
data(tan2009r1)
dim(tan2009r1)
smp <- sampleMSnSet(tan2009r1, fcol = "markers")
dim(smp)
getMarkers(tan2009r1)
getMarkers(smp)



