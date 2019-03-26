library(iC10)


### Name: compare
### Title: Compare results of the iC10 classifier
### Aliases: compare compare.iC10

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp, Exp.by.feat="probe")
features <- normalizeFeatures(features, "scale")
res <- iC10(features)
compare(res, 1:3, newdata=features)



