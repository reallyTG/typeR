library(iC10)


### Name: goodnessOfFit
### Title: Goodness of fit results of the iC10 classifier
### Aliases: goodnessOfFit goodnessOfFit.iC10

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp, Exp.by.feat="probe")
features <- normalizeFeatures(features, "scale")
res <- iC10(features)
goodnessOfFit(res, newdata=features)



