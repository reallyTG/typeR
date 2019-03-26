library(relations)


### Name: SVMBench
### Title: SVM Benchmarking Data and Consensus Relations
### Aliases: SVM_Benchmarking_Classification SVM_Benchmarking_Regression
###   SVM_Benchmarking_Classification_Consensus
###   SVM_Benchmarking_Regression_Consensus
### Keywords: datasets

### ** Examples

data("SVM_Benchmarking_Classification")

## 21 data sets
names(SVM_Benchmarking_Classification)

## 17 methods
relation_domain(SVM_Benchmarking_Classification)

## select weak orders
weak_orders <-
    Filter(relation_is_weak_order, SVM_Benchmarking_Classification)

## only the artifical data sets yield weak orders
names(weak_orders)

## visualize them using Hasse diagrams
if(require("Rgraphviz")) plot(weak_orders)

## Same for regression:
data("SVM_Benchmarking_Regression")

## 12 data sets
names(SVM_Benchmarking_Regression)

## 10 methods
relation_domain(SVM_Benchmarking_Regression)

## select weak orders
weak_orders <-
    Filter(relation_is_weak_order, SVM_Benchmarking_Regression)

## only two of the artifical data sets yield weak orders
names(weak_orders)

## visualize them using Hasse diagrams
if(require("Rgraphviz")) plot(weak_orders)

## Consensus solutions:

data("SVM_Benchmarking_Classification_Consensus")
data("SVM_Benchmarking_Regression_Consensus")

## The solutions for the three families are not unique
print(SVM_Benchmarking_Classification_Consensus)
print(SVM_Benchmarking_Regression_Consensus)

## visualize the consensus weak orders
classW <- SVM_Benchmarking_Classification_Consensus$W
regrW <- SVM_Benchmarking_Regression_Consensus$W
if(require("Rgraphviz")) {
    plot(classW)
    plot(regrW)
}

## in tabular style:
ranking <- function(x) rev(names(sort(relation_class_ids(x))))
sapply(classW, ranking)
sapply(regrW, ranking)

## (prettier and more informative:)
relation_classes(classW[[1L]])



