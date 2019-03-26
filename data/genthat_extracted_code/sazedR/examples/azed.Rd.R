library(sazedR)


### Name: azed
### Title: Compute the AZED component of the SAZED ensemble
### Aliases: azed

### ** Examples

season_length <- 26
y <- sin(1:400*2*pi/season_length)
azed(y)
azed(y, preprocess = FALSE)



