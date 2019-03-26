library(RWeka)


### Name: Weka_classifier_meta
### Title: R/Weka Meta Learners
### Aliases: Weka_classifier_meta AdaBoostM1 Bagging LogitBoost
###   MultiBoostAB Stacking CostSensitiveClassifier
### Keywords: models regression classif

### ** Examples

## Use AdaBoostM1 with decision stumps.
m1 <- AdaBoostM1(Species ~ ., data = iris,
                 control = Weka_control(W = "DecisionStump"))
table(predict(m1), iris$Species)

summary(m1) # uses evaluate_Weka_classifier()

## Control options for the base classifiers employed by the meta
## learners (apart from Stacking) can be given as follows:
m2 <- AdaBoostM1(Species ~ ., data = iris,
                 control = Weka_control(W = list(J48, M = 30)))



