library(iC10)


### Name: iC10
### Title: A copy number and expression-based classfier for breast cancers
### Aliases: iC10

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp, Exp.by.feat="probe")
features <- normalizeFeatures(features, "scale")
res <- iC10(features)




