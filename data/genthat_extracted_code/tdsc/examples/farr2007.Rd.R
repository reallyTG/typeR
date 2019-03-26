library(tdsc)


### Name: farr2007
### Title: Coding Matrix from Farr (2007)
### Aliases: farr2007
### Keywords: CodingMatrix TDSC

### ** Examples

library(tuneR)
wave <- readWave(system.file("extdata", "1.wav", package="tdsc"))
data(farr2007)
t <- tdsc(wave, coding_matrix=farr2007)



