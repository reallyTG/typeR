library(robCompositions)


### Name: expenditures
### Title: synthetic household expenditures toy data set
### Aliases: expenditures
### Keywords: data

### ** Examples


data(expenditures)
## imputing a missing value in the data set using k-nearest neighbor imputation:
expenditures[1,3]
expenditures[1,3] <- NA
impKNNa(expenditures)$xImp[1,3]



