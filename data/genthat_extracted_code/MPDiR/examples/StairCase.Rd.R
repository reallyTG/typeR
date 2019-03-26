library(MPDiR)


### Name: StairCase
### Title: 3-1 Randomly Interleaved Staircase Detection Experiment
### Aliases: StairCase
### Keywords: datasets

### ** Examples

clr = c("red", "blue")
with(StairCase, plot(Contrast ~ Trial, log = "y",
	col = clr[unclass(StairCase)], pch = 16))



