library(iC10)


### Name: iC10-package
### Title: A Copy Number and Expression-Based Classifier for Breast Tumours
### Aliases: iC10-package
### Keywords: package

### ** Examples

require(iC10TrainingData)
data(train.CN)
data(train.Exp)
features <- matchFeatures(Exp=train.Exp, Exp.by.feat="probe")
features <- normalizeFeatures(features, "scale")
res <- iC10(features)
summary(res)
goodnessOfFit(res, newdata=features)
compare(res, iC10=1:2, newdata=features)
compare(res, iC10=2:4, newdata=features)



