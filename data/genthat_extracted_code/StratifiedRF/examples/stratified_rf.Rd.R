library(StratifiedRF)


### Name: stratified_rf
### Title: Stratified Random Forest
### Aliases: stratified_rf
### Keywords: stratified_rf

### ** Examples

data(iris)
groups <- list(c("Sepal.Length","Sepal.Width"),c("Petal.Length","Petal.Width"))
mtry <- c(1,1)
m <- stratified_rf(iris,"Species",groups,mtry,ntrees=2,multicore=FALSE)
summary(m)



