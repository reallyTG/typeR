library(tdsc)


### Name: emptyBands
### Title: Empty Bands Discovery
### Aliases: emptyBands
### Keywords: TDSC

### ** Examples

library(tuneR)
wave <- readWave(system.file("extdata", "1.wav", package="tdsc"))
t <- tdsc(wave)
emptyBands(t,t)




