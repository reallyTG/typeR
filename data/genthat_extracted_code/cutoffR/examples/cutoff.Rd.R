library(cutoffR)


### Name: cutoff
### Title: The CUTOFF Spatio-temporal Imputation Method
### Aliases: cutoff

### ** Examples

data(hqmr.data)
# check the number of missing values
nmissing(hqmr.data[, -79])
# impute the data by the CUTOFF method
impdata <- cutoff(data = hqmr.data)
nmissing(impdata)



