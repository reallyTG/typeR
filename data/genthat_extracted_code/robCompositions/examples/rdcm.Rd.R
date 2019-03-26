library(robCompositions)


### Name: rdcm
### Title: relative difference between covariance matrices
### Aliases: rdcm
### Keywords: manip

### ** Examples

data(expenditures)
x <- expenditures
x[1,3] <- NA
xi <- impKNNa(x)$xImp
rdcm(expenditures, xi)



