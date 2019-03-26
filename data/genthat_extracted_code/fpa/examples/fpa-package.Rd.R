library(fpa)


### Name: fpa-package
### Title: Spatio-temporal Fixation Pattern Analysis
### Aliases: fpa-package fpa
### Keywords: eye movements fixation probability package

### ** Examples

data(rawdata)
newdata <- ft2fp (rawdata, 4, 3000, 100)
pattern <- get_pattern(newdata)
plot_pattern(pattern)



