library(prcbench)


### Name: create_testset
### Title: Create a list of test datasets
### Aliases: create_testset

### ** Examples

## Create a balanced data set with 50 positives and 50 negatives
tset1 <- create_testset("bench", "b100")
tset1

## Create an imbalanced data set with 25 positives and 75 negatives
tset2 <- create_testset("bench", "i100")
tset2

## Create P1 dataset
tset3 <- create_testset("curve", "c1")
tset3

## Create P1 dataset
tset4 <- create_testset("curve", c("c1", "c2"))
tset4




