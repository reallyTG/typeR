library(phonTools)


### Name: powertrack
### Title: Power tracking
### Aliases: powertrack

### ** Examples


## plot the waveform and power of a given sound.
data (sound)
# sound = loadsound()        ## run this line to use you own sound

## compare waveform and power
par (mfrow = c(2,1), mar = c(4,4,1,1));
plot (sound)
powertrack (sound)



