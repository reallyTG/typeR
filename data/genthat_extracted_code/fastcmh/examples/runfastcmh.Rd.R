library(fastcmh)


### Name: runfastcmh
### Title: Run the fastcmh algorithm
### Aliases: runfastcmh

### ** Examples

#Example with default naming convention used for data, label and cov files
# Note: using "/data/" as the argument for folder
#       accesses the data/ directory in the fastcmh package folder
mylist <- runfastcmh("/data/")

#Example where the progress will be shown
mylist <- runfastcmh(folder="/data/", showProcessing=TRUE)

#Example where many parameters are specified
mylist <- runfastcmh(folder="/data/", data="data2.txt", alpha=0.01, Lmax=7)

#Example where Gilbert's Tarone-FDR procedure is used
mylist <- runfastcmh("/data/", doFDR=TRUE)

#Example where FDR procedure takes some dependence structures into account
mylist <- runfastcmh("/data/", doFDR=TRUE, useDependenceFDR=TRUE)



