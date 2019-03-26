library(RoughSets)


### Name: RI.CN2Rules.RST
### Title: Rule induction using a version of CN2 algorithm
### Aliases: RI.CN2Rules.RST

### ** Examples

###########################################################
## Example
##############################################################
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
rules <- RI.CN2Rules.RST(data.tra, K = 5)
rules

## predicitons for the test set:
pred.vals <- predict(rules, data.tst)

## checking the accuracy of predictions:
mean(pred.vals == true.classes)



