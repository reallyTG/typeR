library(NetIndices)


### Name: TrophInd
### Title: The trophic level and omnivory index
### Aliases: TrophInd
### Keywords: utilities

### ** Examples
# The takapoto atoll network
# First trophic level without assuming that TL of detritus and DOC is 1
TrophInd(Takapoto, Import = "CO2",
        Export = c("CO2", "Sedimentation", "Grazing"))

# Now imposing TL=1 for detritus and DOC 
TrophInd(Takapoto, Import = "CO2",
        Export = c("CO2", "Sedimentation", "Grazing"),
        Dead = c("Detritus", "DOC"))


