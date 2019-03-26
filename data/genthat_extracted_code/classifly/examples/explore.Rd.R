library(classifly)


### Name: explore
### Title: Default method for exploring objects
### Aliases: explore

### ** Examples

if (require("e1071")) {
bsvm <- best.svm(Species~., data = iris, gamma = 2^(-1:1),
  cost = 2^(2:+ 4), probability=TRUE)
explore(bsvm, iris)
}



