library(h2o)


### Name: h2o.setLevels
### Title: Set Levels of H2O Factor Column
### Aliases: h2o.setLevels

### ** Examples

## No test: 
h2o.init()
iris_hf <- as.h2o(iris)
new.levels <- c("setosa", "versicolor", "caroliniana")
iris_hf$Species <- h2o.setLevels(iris_hf$Species, new.levels, in.place = FALSE)
h2o.levels(iris_hf$Species)
## End(No test)



