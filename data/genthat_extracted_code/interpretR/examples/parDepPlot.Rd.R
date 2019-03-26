library(interpretR)


### Name: parDepPlot
### Title: Model interpretation functions: Partial Dependence Plots
### Aliases: parDepPlot

### ** Examples

library(randomForest)
#Prepare data
data(iris)
iris <- iris[1:100,]
iris$Species <- as.factor(ifelse(factor(iris$Species)=="setosa",0,1))

#Cross-validated models
#Estimate 10 models and create 10 test sets
data <- list()
rf <- list()
for (i in 1:10) {
  ind <- sample(nrow(iris),50)
  rf[[i]] <- randomForest(Species~., iris[ind,])
  data[[i]] <- iris[-ind,]
}


parDepPlot(x.name="Petal.Width", object=rf, data=data)

#Single model
#Estimate a single model
ind <- sample(nrow(iris),50)
rf <- randomForest(Species~., iris[ind,])
parDepPlot(x.name="Petal.Width", object=rf, data=iris[-ind,])



