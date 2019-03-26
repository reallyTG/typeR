library(seewave)


### Name: ama
### Title: Amplitude modulation analysis of a time wave
### Aliases: ama
### Keywords: dplot ts

### ** Examples

data(orni)
# detection of the main amplitude modulation in a cicada song:
# one with a 0.258 kHz frequency (due to pulses in the echemes)
# one with a 2.369 kHz frequency (fundamental frequency)
ama(orni,f=22050,wl=1024)
# these amplitude modulations can be identify with a cursor:
ama(orni,f=22050,wl=1024,identify=TRUE)



