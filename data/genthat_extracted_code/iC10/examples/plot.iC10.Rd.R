library(iC10)


### Name: plot.iC10
### Title: Plot results of the iC10 classifier
### Aliases: plot.iC10

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp, Exp.by.feat="probe")
features <- normalizeFeatures(features, "scale")
res <- iC10(features)
plot(res, sample.name=10)
plot(res, newdata=features)



