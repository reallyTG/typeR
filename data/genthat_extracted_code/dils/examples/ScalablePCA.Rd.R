library(dils)


### Name: ScalablePCA
### Title: Perform Principal Component Analysis on a large data set
### Aliases: ScalablePCA

### ** Examples

data(iris)        # provides example data
prcomp(iris[,1:4], center=FALSE, scale.=FALSE)$rotation[,1]
ScalablePCA(iris, subsample=10, use.cols=1:4)
ScalablePCA(iris, subsample=10, ignore.cols=5)



