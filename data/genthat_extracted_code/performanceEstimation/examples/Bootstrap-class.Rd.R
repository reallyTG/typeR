library(performanceEstimation)


### Name: Bootstrap-class
### Title: Class "Bootstrap"
### Aliases: Bootstrap Bootstrap-class show,Bootstrap-method
### Keywords: classes

### ** Examples

showClass("Bootstrap")

s <- Bootstrap(type=".632",nReps=400)
s

## Small example illustrating the format of user supplied data splits
s2 <- Bootstrap(dataSplits=list(list(test=sample(1:150,50),train=sample(1:150,50)),
                                list(test=sample(1:150,50),train=sample(1:150,50)),
                                list(test=sample(1:150,50),train=sample(1:150,50))
                               ))
s2
s2@dataSplits



