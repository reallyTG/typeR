library(MachineShop)


### Name: performance_curve
### Title: Performance Curves
### Aliases: performance_curve Curves performance_curve.Resamples
###   performance_curve.default

### ** Examples

library(MASS)

res <- resample(type ~ ., data = Pima.tr, model = GBMModel)

## ROC curve
roc <- performance_curve(res)
plot(roc)
auc(roc)




