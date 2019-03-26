library(sazedR)


### Name: ze
### Title: Compute the ZE component of the SAZED ensemble
### Aliases: ze

### ** Examples

season_length <- 26
y <- sin(1:400*2*pi/season_length)
ze(y)
ze(y, preprocess = FALSE)



