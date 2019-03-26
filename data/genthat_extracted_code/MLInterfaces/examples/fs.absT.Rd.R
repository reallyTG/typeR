library(MLInterfaces)


### Name: fs.absT
### Title: support for feature selection in cross-validation
### Aliases: fs.absT fs.probT fs.topVariance
### Keywords: models

### ** Examples

library("MASS")
data(crabs)
# we will demonstrate this procedure with the crabs data.
# first, create the closure to pick 3 features
demFS = fs.absT(3)
# run it on the entire dataset with features excluding sex
demFS(sp~.-sex, crabs)
# emulate cross-validation by excluding last 50 records
demFS(sp~.-sex, crabs[1:150,])
# emulate cross-validation by excluding first 50 records -- different features retained
demFS(sp~.-sex, crabs[51:200,])



