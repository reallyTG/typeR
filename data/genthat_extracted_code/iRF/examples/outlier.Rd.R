library(iRF)


### Name: outlier
### Title: Compute outlying measures
### Aliases: outlier outlier.randomForest outlier.default
### Keywords: classif

### ** Examples

set.seed(1)
iris.rf <- randomForest(iris[,-5], iris[,5], proximity=TRUE)
plot(outlier(iris.rf), type="h",
     col=c("red", "green", "blue")[as.numeric(iris$Species)])



