library(StratifiedRF)


### Name: varimp_stratified_rf
### Title: Heuristic on variable importance
### Aliases: varimp_stratified_rf

### ** Examples

data(iris)
groups <- list(c("Sepal.Length","Sepal.Width"),c("Petal.Length","Petal.Width"))
mtry <- c(1,1)
m <- stratified_rf(iris,"Species",groups,mtry,ntrees=2,multicore=FALSE)
varimp_stratified_rf(m)



