library(sazedR)


### Name: Sa
### Title: Compute the SA component of the SAZED ensemble
### Aliases: Sa

### ** Examples

season_length <- 26
y <- sin(1:400*2*pi/season_length)
Sa(y)
Sa(y, preprocess = FALSE)



