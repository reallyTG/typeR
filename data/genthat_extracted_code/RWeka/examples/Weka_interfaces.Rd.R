library(RWeka)


### Name: Weka_interfaces
### Title: R/Weka interfaces
### Aliases: make_Weka_associator make_Weka_attribute_evaluator
###   make_Weka_classifier make_Weka_clusterer make_Weka_filter
###   list_Weka_interfaces make_Weka_package_loader
### Keywords: interface models

### ** Examples

## Create an interface to Weka's Naive Bayes classifier.
NB <- make_Weka_classifier("weka/classifiers/bayes/NaiveBayes")
## Note that this has a very useful print method:
NB
## And we can use the Weka Option Wizard for finding out more:
WOW(NB)
## And actually use the interface ...
if(require("e1071", quietly = TRUE) &&
   require("mlbench", quietly = TRUE)) {
    data("HouseVotes84", package = "mlbench")
    model <- NB(Class ~ ., data = HouseVotes84)
    predict(model, HouseVotes84[1:10, -1])
    predict(model, HouseVotes84[1:10, -1], type = "prob")
}
## (Compare this to David Meyer's naiveBayes() in package 'e1071'.)



