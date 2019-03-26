library(scorecardModelUtils)


### Name: others_class
### Title: Clubbing of classes of categorical variable with low population
###   percentage into one class
### Aliases: others_class

### ** Examples

data <- iris[c(1:110),]
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
data$Species <- as.character(data$Species)
data_otherclass <- others_class(base = data,target = "Y",column_name = "Species",threshold = 0.15)



