library(CORElearn)


### Name: rfOutliers
### Title: Random forest based outlier detection
### Aliases: rfOutliers
### Keywords: cluster robust

### ** Examples

#first create a random forest tree using CORElearn
dataset <- iris
md <- CoreModel(Species ~ ., dataset, model="rf", rfNoTrees=30, 
                maxThreads=1)
outliers <- rfOutliers(md, dataset)
plot(abs(outliers))
#for a nicer display try 
plot(md, dataset, rfGraphType="outliers")

destroyModels(md) # clean up




