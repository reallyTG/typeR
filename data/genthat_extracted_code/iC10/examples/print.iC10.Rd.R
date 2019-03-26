library(iC10)


### Name: print.iC10
### Title: Print results of the iC10 classifier
### Aliases: print.iC10

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp, Exp.by.feat="probe")
features <- normalizeFeatures(features, "scale")
res <- iC10(features)
res



