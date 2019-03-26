library(iC10)


### Name: summary.iC10
### Title: Summary results of the iC10 classifier
### Aliases: summary.iC10

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp,
Exp.by.feat="probe", ref="hg18")
features <- normalizeFeatures(features, "scale")
res <- iC10(features)
summary(res)



