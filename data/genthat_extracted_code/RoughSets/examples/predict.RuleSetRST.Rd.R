library(RoughSets)


### Name: predict.RuleSetRST
### Title: Prediction of decision classes using rule-based classifiers.
### Aliases: predict.RST predict.RuleSetRST

### ** Examples

##############################################
## Example: Classification Task
##############################################
data(RoughSetData)
wine.data <- RoughSetData$wine.dt
set.seed(13)
wine.data <- wine.data[sample(nrow(wine.data)),]

## Split the data into a training set and a test set,
## 60% for training and 40% for testing:
idx <- round(0.6 * nrow(wine.data))
wine.tra <-SF.asDecisionTable(wine.data[1:idx,],
                              decision.attr = 14,
                              indx.nominal = 14)
wine.tst <- SF.asDecisionTable(wine.data[(idx+1):nrow(wine.data), -ncol(wine.data)])

true.classes <- wine.data[(idx+1):nrow(wine.data), ncol(wine.data)]

## discretization:
cut.values <- D.discretization.RST(wine.tra,
                                   type.method = "unsupervised.quantiles",
                                   nOfIntervals = 3)
data.tra <- SF.applyDecTable(wine.tra, cut.values)
data.tst <- SF.applyDecTable(wine.tst, cut.values)

## rule induction from the training set:
rules <- RI.LEM2Rules.RST(data.tra)

## predicitons for the test set:
pred.vals1 <- predict(rules, data.tst)
pred.vals2 <- predict(rules, data.tst,
                      votingMethod = X.laplace)
pred.vals3 <- predict(rules, data.tst,
                      votingMethod = X.rulesCounting)

## checking the accuracy of predictions:
mean(pred.vals1 == true.classes)
mean(pred.vals2 == true.classes)
mean(pred.vals3 == true.classes)



