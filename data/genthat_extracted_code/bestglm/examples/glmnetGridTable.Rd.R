library(bestglm)


### Name: glmnetGridTable
### Title: Multipanel Display and Table Glmnet CV Output.
### Aliases: glmnetGridTable
### Keywords: models regression

### ** Examples

set.seed(7733551)
out <- trainTestPartition(mcdonald)
round(glmnetGridTable(out),4)



