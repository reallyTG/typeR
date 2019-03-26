library(sazedR)


### Name: zed
### Title: Compute the ZED component of the SAZED ensemble
### Aliases: zed

### ** Examples

season_length <- 26
y <- sin(1:400*2*pi/season_length)
zed(y)
zed(y, preprocess = FALSE)



