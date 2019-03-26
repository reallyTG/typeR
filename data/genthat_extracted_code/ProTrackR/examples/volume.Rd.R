library(ProTrackR)


### Name: volume
### Title: Default playback volume of PTSample
### Aliases: volume volume,PTSample-method volume<-
###   volume<-,PTSample,numeric-method

### ** Examples

data("mod.intro")

## get the volume of the first sample of mod.intro:

volume(PTSample(mod.intro, 1))

## Let's lower the volume of this sample to 32
## (or as a hexadecimal: 0x20):

volume(PTSample(mod.intro, 1)) <- 0x20




