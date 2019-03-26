library(ChemoSpec2D)


### Name: normSpectra2D
### Title: Normalize a Spectra2D Object
### Aliases: normSpectra2D
### Keywords: utilities

### ** Examples


data(MUD1)
MUD1n <- normSpectra2D(MUD1)
MUD1b <- removeFreq(MUD1, remF2 = 2.5 ~ 3.5)
MUD1bn <- normSpectra2D(MUD1b)




