library(iC10)


### Name: normalizeFeatures
### Title: Normalization of expression features
### Aliases: normalizeFeatures

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp,
Exp.by.feat="probe", ref="hg18")
features <- normalizeFeatures(features, "scale")



