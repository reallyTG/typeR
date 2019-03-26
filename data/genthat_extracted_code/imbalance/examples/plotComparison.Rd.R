library(imbalance)


### Name: plotComparison
### Title: Plots comparison between the original and the new balanced
###   dataset.
### Aliases: plotComparison

### ** Examples

data(iris0)
set.seed(12345)

rwoSamples <- rwo(iris0, numInstances = 100)
rwoBalanced <- rbind(iris0, rwoSamples)
plotComparison(iris0, rwoBalanced, names(iris0), cols = 2, classAttr = "Class")




