library(ProTrackR)


### Name: loopSample
### Title: Looped waveform of a sample
### Aliases: loopSample loopSample,PTSample-method

### ** Examples

data("mod.intro")

## Loop sample number 4 10 times:
wform <- loopSample(PTSample(mod.intro, 4), times = 10)
plot(wform, type = "l")

## Loop sample number 4, such that its
## final length is 5000 samples:
wform <- loopSample(PTSample(mod.intro, 4), n_samples = 5000)
plot(wform, type = "l")




