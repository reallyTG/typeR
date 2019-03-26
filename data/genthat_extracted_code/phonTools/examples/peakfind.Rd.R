library(phonTools)


### Name: peakfind
### Title: Find the Peaks
### Aliases: peakfind

### ** Examples

data (sound)
sound2 = sound$sound[10000:11000] 
spectrum = spectralslice (sound2, padding = 0, output = TRUE, show = TRUE)
peakfind (spectrum[,2])



