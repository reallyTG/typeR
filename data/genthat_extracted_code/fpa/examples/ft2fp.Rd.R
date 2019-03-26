library(fpa)


### Name: ft2fp
### Title: Convert fixation time to fixation probability
### Aliases: ft2fp

### ** Examples

data(rawdata)
newdata <- ft2fp (rawdata, 4, 3000, 100)
newdata <- ft2fp (rawdata, 4, 3000, 100, norm=TRUE, rm.nr=TRUE, rm.1p=FALSE) 



