library(RFmarkerDetector)


### Name: lqvarFilter
### Title: Filtering 'low quality' variables from the original dataset
### Aliases: lqvarFilter

### ** Examples

 ## load the included example dataset
data(cachexiaData)
## call lqvarFilter with the parameter exclude set to TRUE (default) 
## in order to exclude the first two columns of the dataset from scaling
res <- lqvarFilter(cachexiaData, threshold = 0.4, exclude = TRUE)
data.filtered <- res$filtered_dataset 



