library(sazedR)


### Name: S
### Title: Compute the S component of the SAZED ensemble
### Aliases: S

### ** Examples

season_length <- 26
y <- sin(1:400*2*pi/season_length)
S(y)
S(y, preprocess = FALSE)



