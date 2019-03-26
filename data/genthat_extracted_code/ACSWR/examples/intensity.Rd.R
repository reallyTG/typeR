library(ACSWR)


### Name: intensity
### Title: Blocking for Intensity Data Set
### Aliases: intensity
### Keywords: blocked design

### ** Examples

data(intensity)
intensity.aov <- aov(Intensity~Ground*Filter+Error(Operator),intensity)
summary(intensity.aov)
intensity.aov



