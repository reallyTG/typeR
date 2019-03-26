library(hsdar)


### Name: Extract Speclib by index
### Title: Indexing Speclib
### Aliases: [,Speclib,ANY,ANY-method [,Speclib,ANY,ANY,ANY-method
###   [,Speclib-method
### Keywords: utilities

### ** Examples

data(spectral_data)

## Get the first five spectra
spec_1_5 <- spectral_data[1:5,]
spec_1_5

## Get the first ten bands
spec_1_10 <- spectral_data[,1:10]
spec_1_10

## Get the bands number 20 to 30 for the third and fifth spectra
spec_20_30 <- spectral_data[c(3,5),20:30]
spec_20_30



