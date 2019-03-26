library(e1071)


### Name: boxplot.bclust
### Title: Boxplot of Cluster Profiles
### Aliases: boxplot.bclust
### Keywords: hplot

### ** Examples

data(iris)
bc1 <- bclust(iris[,1:4], 3, base.centers=5)
boxplot(bc1)



