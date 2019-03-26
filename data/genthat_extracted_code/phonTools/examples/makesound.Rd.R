library(phonTools)


### Name: makesound
### Title: Make a 'sound' object
### Aliases: makesound

### ** Examples


data (sound)
## take only the first 10000 samples from a 'sound' object
tmp = sound$sound[1:10000]
## and make a new 'sound' object
tmp = makesound (tmp, fs = 22050)
tmp

## get ready to make two plots with thin margins
#multiplot (2); par (mar = c(4,4,1,1));
## and show a spectrogram of the original
#spectrogram (sound)       

## and the new, truncated version
#spectrogram (tmp)         




