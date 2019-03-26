library(imbalance)


### Name: trainWrapper
### Title: Generic methods to train classifiers
### Aliases: trainWrapper

### ** Examples

myWrapper <- structure(list(), class="C50Wrapper")
trainWrapper.C50Wrapper <- function(wrapper, train, trainClass){
  C50::C5.0(train, trainClass)
}



