library(mice)


### Name: nhanes2
### Title: NHANES example - mixed numerical and discrete variables
### Aliases: nhanes2
### Keywords: datasets

### ** Examples



imp <- mice(nhanes2)     # create 5 imputed data sets
complete(imp)           # print the first imputed data set




