library(iRF)


### Name: MDSplot
### Title: Multi-dimensional Scaling Plot of Proximity matrix from
###   randomForest
### Aliases: MDSplot
### Keywords: classif tree

### ** Examples

set.seed(1)
data(iris)
iris.rf <- randomForest(Species ~ ., iris, proximity=TRUE,
                        keep.forest=FALSE)
MDSplot(iris.rf, iris$Species)
## Using different symbols for the classes:
MDSplot(iris.rf, iris$Species, palette=rep(1, 3), pch=as.numeric(iris$Species))



