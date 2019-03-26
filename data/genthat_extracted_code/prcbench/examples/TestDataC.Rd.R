library(prcbench)


### Name: TestDataC
### Title: R6 class of test dataset for Precision-Recall curve evaluation
### Aliases: TestDataC
### Keywords: datasets

### ** Examples

## Initialize with scores, labels, and a dataset name
testset <- TestDataC$new(c(0.1, 0.2), c(1, 0), "c4")
testset

## Set base points
testset$set_basepoints_x(c(0.13, 0.2))
testset$set_basepoints_y(c(0.5, 0.6))
testset




