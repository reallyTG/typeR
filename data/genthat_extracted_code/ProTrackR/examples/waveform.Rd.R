library(ProTrackR)


### Name: waveform
### Title: Extract or replace a PTSample waveform
### Aliases: waveform waveform,PTSample-method waveform<-
###   waveform<-,PTSample-method

### ** Examples

data("mod.intro")

## Loop sample #1 of mod.intro beyond it's
## length of 1040 samples:
wav1 <- waveform(PTSample(mod.intro, 1),
                 1, 5000)

## get the waveform from sample #2
## of mod.intro:
wav2 <- waveform(PTSample(mod.intro, 2))

## create an echo effect using
## the extracted waveform:
wav2 <- c(wav2, rep(128, 1000)) +
        c(rep(128, 1000), wav2)*0.25 - 25

## assign this echoed sample to
## sample #2 in mod.intro:
waveform(PTSample(mod.intro, 2)) <- wav2

## Blank out sample #1 in mod.intro:
waveform(PTSample(mod.intro, 1)) <- NA




