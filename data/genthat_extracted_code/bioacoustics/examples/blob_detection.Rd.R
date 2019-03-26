library(bioacoustics)


### Name: blob_detection
### Title: Blob detection of a region of interest into a spectrographic
###   representation of the recording
### Aliases: blob_detection

### ** Examples

data(myotis)
Output <- blob_detection(myotis, time_exp = 10, contrast_boost = 30, bg_substract = 30)
Output$data




