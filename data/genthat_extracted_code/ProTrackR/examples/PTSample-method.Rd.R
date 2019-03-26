library(ProTrackR)


### Name: PTSample-method
### Title: Coerce to or replace PTSample
### Aliases: PTSample-method PTSample,Wave,missing-method
###   PTSample,raw,missing-method PTSample,PTModule,numeric-method
###   PTSample<- PTSample<-,PTModule,numeric,PTSample-method

### ** Examples

## Create a raw data sine wave:
raw_sine <- signedIntToRaw(round(sin(2*pi*(0:275)/276)*127))

data("mod.intro")

## Replace sample number 1 from mod.intro
## with the sine wave:
PTSample(mod.intro, 1) <-
  PTSample(raw_sine)

## Note that the replacement above
## could also (maybe more efficiently)
## be done with the 'waveform' method

## Restore the loop in sample number 1:
loopLength(PTSample(mod.intro, 1)) <- 276




