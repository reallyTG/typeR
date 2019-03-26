library(RFmarkerDetector)


### Name: rsdFilter
### Title: Filtering less informative variables
### Aliases: rsdFilter

### ** Examples

 ## load the included example dataset
data(cachexiaData)
## call rsdFilter with the parameter exclude set to TRUE (default) 
## in order to exclude the first two columns of the dataset from scaling
data.filtered <- rsdFilter(cachexiaData, threshold = 15, exclude = TRUE)



