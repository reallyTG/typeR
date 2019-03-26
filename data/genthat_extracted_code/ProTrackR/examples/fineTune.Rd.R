library(ProTrackR)


### Name: fineTune
### Title: Fine tune a PTSample
### Aliases: fineTune fineTune,PTSample-method fineTune<-
###   fineTune<-,PTSample,numeric-method

### ** Examples

data("mod.intro")

## get the finetune of the first sample of mod.intro:

fineTune(PTSample(mod.intro, 1))

## Let's tweak the finetune of the first sample of
## mod.intro to -1:

fineTune(PTSample(mod.intro, 1)) <- -1




