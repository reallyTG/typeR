library(mice)


### Name: nhanes
### Title: NHANES example - all variables numerical
### Aliases: nhanes
### Keywords: datasets

### ** Examples

 

imp <- mice(nhanes)     # create 5 imputed data sets
complete(imp)           # print the first imputed data set




