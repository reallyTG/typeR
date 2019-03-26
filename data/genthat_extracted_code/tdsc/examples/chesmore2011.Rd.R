library(tdsc)


### Name: chesmore2011
### Title: Coding Matrix from Chesmore (2011)
### Aliases: chesmore2011
### Keywords: CodingMatrix TDSC

### ** Examples

library(tuneR)
wave <- readWave(system.file("extdata", "1.wav", package="tdsc"))
data(chesmore2011)
t <- tdsc(wave, coding_matrix=chesmore2011)



