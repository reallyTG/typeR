library(scorecardModelUtils)


### Name: club_cat_class
### Title: Clubbing class of a categorical variable with low population
###   percentage with another class of similar event rate
### Aliases: club_cat_class

### ** Examples

data <- iris[1:110,]
data$Species <- as.character(data$Species)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
data_clubclass <- club_cat_class(base = data,target = "Y",variable = "Species",threshold = 0.2)



