library(StratifiedRF)


### Name: predict.stratified_rf
### Title: Make predictions on new data
### Aliases: predict.stratified_rf
### Keywords: predict.stratified_rf

### ** Examples

data(iris)
groups <- list(c("Sepal.Length","Sepal.Width"),c("Petal.Length","Petal.Width"))
mtry <- c(1,1)
m <- stratified_rf(iris,"Species",groups,mtry,ntrees=2,multicore=FALSE)
predict(m,iris)



