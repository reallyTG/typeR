library(ProTrackR)


### Name: sampleRate
### Title: Calculate the sample rate for a note or period value
### Aliases: sampleRate noteToSampleRate periodToSampleRate sampleRate
###   periodToSampleRate

### ** Examples

## calculate the sample rate for a ProTracker period value of 200
periodToSampleRate(200)

## calculate the sample rate for a sample at note 'A-3'
noteToSampleRate("A-3")

## note that the NTSC video system gives a slightly different rate:
noteToSampleRate("A-3", video = "NTSC")

## fine tuning a sample will also give a slightly different rate:
noteToSampleRate("A-3", finetune = -1)




