library(RFmarkerDetector)


### Name: autoscale
### Title: Unit variance scaling method performed on the columns of the
###   data (i.e. metabolite concentrations measured by 1H NMR or binned 1H
###   NMR spectra)
### Aliases: autoscale

### ** Examples

## load the included example dataset
data(cachexiaData)
## call autoscale with the parameter exclude set to TRUE (default) 
## in order to exclude the first two columns of the dataset from scaling
data.scaled <- autoscale(cachexiaData, exclude = TRUE)



