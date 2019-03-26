library(pointRes)


### Name: pointer.norm
### Title: Calculate pointer years using the normalization in a moving
###   window method
### Aliases: pointer.norm

### ** Examples

## Calculate pointer years on tree-ring series using method.thresh "Cropper"
## and a user-defined threshold for event-year definition of 1
data(s033)
py_c <- pointer.norm(s033, window = 5, method.thresh = "Cropper", 
                     C.thresh = 1, series.thresh = 75)
py_c$out

## Calculate pointer years on tree-ring series using method.thresh "Neuwirth"
data(s033)
py_n <- pointer.norm(s033, window = 5, method.thresh = "Neuwirth", 
                     series.thresh = 75)
py_n$out




