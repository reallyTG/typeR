library(performanceEstimation)


### Name: MonteCarlo-class
### Title: Class "MonteCarlo"
### Aliases: MonteCarlo MonteCarlo-class show,MonteCarlo-method
### Keywords: classes

### ** Examples

showClass("MonteCarlo")

m1 <- MonteCarlo(nReps=10,szTrain=0.3,szTest=0.2)
m1

## Small example illustrating the format of user supplied data splits
## it assumes that the source data is formed by 10 cases and that each
## model is trainined with 3 cases and tested in the following case.
## This is obviously a unrealistic example in terms of size but
## illustrates the format of the data splits
m2 <- MonteCarlo(dataSplits=list(list(test=sample(1:150,50),train=sample(1:150,50)),
                                   list(test=sample(1:150,50),train=sample(1:150,50)),
                                   list(test=sample(1:150,50),train=sample(1:150,50))
                                  ))
m2




