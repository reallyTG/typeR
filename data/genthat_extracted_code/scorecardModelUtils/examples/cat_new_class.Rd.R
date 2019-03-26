library(scorecardModelUtils)


### Name: cat_new_class
### Title: Clubbing class of categorical variables with low population
###   percentage with another class of similar event rate
### Aliases: cat_new_class

### ** Examples

data <- iris[1:110,]
data$Species <- as.character(data$Species)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
data_newclass <- cat_new_class(base = data,target = "Y",cat_var_name = "Species",threshold = 0.1)



