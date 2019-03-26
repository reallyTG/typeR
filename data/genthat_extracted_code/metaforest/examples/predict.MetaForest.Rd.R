library(metaforest)


### Name: predict.MetaForest
### Title: MetaForest prediction
### Aliases: predict.MetaForest

### ** Examples

set.seed(56)
data <- SimulateSMD(k_train = 100, model = es * x[,1] * x[,2])
#Conduct fixed-effects MetaForest analysis
mf.fixed <- MetaForest(formula = yi ~ ., data = data$training,
                      whichweights = "fixed", method = "DL")
predicted <- predict(mf.fixed, data = data$testing)$predictions
r2_cv <- sum((predicted - mean(data$training$yi)) ^ 2)/
         sum((data$testing$yi - mean(data$training$yi)) ^ 2)



