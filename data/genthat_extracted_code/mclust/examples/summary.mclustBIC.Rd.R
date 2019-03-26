library(mclust)


### Name: summary.mclustBIC
### Title: Summary function for model-based clustering via BIC
### Aliases: summary.mclustBIC print.summary.mclustBIC summary.mclustBIC
###   summaryMclustBIC summaryMclustBICn printSummaryMclustBIC
###   printSummaryMclustBICn
### Keywords: cluster

### ** Examples

irisBIC <- mclustBIC(iris[,-5])
summary(irisBIC, iris[,-5])
summary(irisBIC, iris[,-5], G = 1:6, modelNames = c("VII", "VVI", "VVV"))



