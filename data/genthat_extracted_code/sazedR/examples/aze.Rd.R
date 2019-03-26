library(sazedR)


### Name: aze
### Title: Compute the AZE component of the SAZED ensemble
### Aliases: aze

### ** Examples

season_length <- 26
y <- sin(1:400*2*pi/season_length)
aze(y)
aze(y, preprocess = FALSE)



