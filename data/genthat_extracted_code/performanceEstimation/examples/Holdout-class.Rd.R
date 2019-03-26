library(performanceEstimation)


### Name: Holdout-class
### Title: Class "Holdout"
### Aliases: Holdout Holdout-class show,Holdout-method
### Keywords: classes

### ** Examples

showClass("Holdout")

## 10 repetitions of a holdout experiment leaving on each repetition
## 20% of the cases randomly chosen as test set (the holdout)
h1 <- Holdout(nReps=10,hldSz=0.2,strat=TRUE)
h1

## Small example illustrating the format of user supplied data splits
## in this case for 3 repetitions of a Holdout process where each test
## set has 10 cases
h2 <- Holdout(dataSplits=list(1:10,11:20,21:30))
h2




