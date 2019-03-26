library(mlr)


### Name: selectFeatures
### Title: Feature selection by wrapper approach.
### Aliases: selectFeatures

### ** Examples

## No test: 
rdesc = makeResampleDesc("Holdout")
ctrl = makeFeatSelControlSequential(method = "sfs", maxit = NA)
res = selectFeatures("classif.rpart", iris.task, rdesc, control = ctrl)
analyzeFeatSelResult(res)
## End(No test)



