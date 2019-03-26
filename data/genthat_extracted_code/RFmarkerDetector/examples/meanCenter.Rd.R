library(RFmarkerDetector)


### Name: meanCenter
### Title: Mean centering performed on the columns of the data (i.e.
###   metabolite concentrations measured by 1H NMR or binned 1H NMR
###   spectra)
### Aliases: meanCenter

### ** Examples

## load the included example dataset
data(cachexiaData)
## call meanCenter with the parameter exclude set to TRUE (default) 
## in order to exclude the first two columns of the dataset from scaling
data.scaled <- meanCenter(cachexiaData, exclude = TRUE)



