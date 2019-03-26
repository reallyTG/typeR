library(RFmarkerDetector)


### Name: paretoscale
### Title: Pareto scaling method performed on the columns of the data table
###   (i.e. metabolite concentrations measured by 1H NMR or binned 1H NMR
###   spectra)
### Aliases: paretoscale

### ** Examples

#' ## load the included example dataset
data(cachexiaData)
## call paretoscale with the parameter exclude set to TRUE (default) 
## in order to exclude the first two columns of the dataset from scaling
data.scaled <- paretoscale(cachexiaData, exclude = TRUE) 



