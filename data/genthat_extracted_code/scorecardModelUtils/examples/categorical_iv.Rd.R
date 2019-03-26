library(scorecardModelUtils)


### Name: categorical_iv
### Title: IV table for individual categorical variable
### Aliases: categorical_iv

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
cat_iv <- categorical_iv(base = data,target = "Y",variable = "Species",event = 1)



