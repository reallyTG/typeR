library(performanceEstimation)


### Name: PredTask-class
### Title: Class "PredTask"
### Aliases: PredTask PredTask-class show,PredTask-method
### Keywords: classes

### ** Examples

showClass("PredTask")
data(iris)
PredTask(Species  ~ .,iris)
PredTask(Species  ~ .,iris[1:20,],"irisSubset")
## after the next example you can safely remove the iris data frame from
## your environment because the data was stored inside the "t" object.
t <- PredTask(Species ~ ., iris,copy=TRUE) 



