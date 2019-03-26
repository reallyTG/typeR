library(hypervolume)


### Name: hypervolume_variable_importance
### Title: Hypervolume variable importance
### Aliases: hypervolume_variable_importance

### ** Examples

# low parameter values for speed
data(iris)
hv = hypervolume_gaussian(subset(iris, Species=="versicolor")[,1:2],samples.per.point=10)
varimp = hypervolume_variable_importance(hv,verbose=FALSE)
barplot(varimp)



