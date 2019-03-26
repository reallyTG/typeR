library(iC10)


### Name: matchFeatures
### Title: Matching features from the classifier to the test data.
### Aliases: matchFeatures

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp,Exp.by.feat="probe", ref="hg18")
str(features)



