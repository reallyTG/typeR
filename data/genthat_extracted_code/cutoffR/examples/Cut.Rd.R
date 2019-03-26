library(cutoffR)


### Name: Cut
### Title: The simple version of CUTOFF
### Aliases: Cut

### ** Examples

data(hqmr.data)
#' # check the number of missing values
nmissing(hqmr.data[, -79])
# impute the data by the CUTOFF method
impdata <- Cut(data = hqmr.data)
nmissing(impdata)



