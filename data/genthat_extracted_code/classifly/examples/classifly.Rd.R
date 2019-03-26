library(classifly)


### Name: classifly
### Title: Classifly provides a convenient method to fit a classification
###   function and then explore the results in the original high
###   dimensional space.
### Aliases: classifly package-classifly
### Keywords: dynamic

### ** Examples

data(kyphosis, package = "rpart")
library(MASS)
classifly(kyphosis, Kyphosis ~ . , lda)
classifly(kyphosis, Kyphosis ~ . , qda)
classifly(kyphosis, Kyphosis ~ . , glm, family="binomial")
classifly(kyphosis, Kyphosis ~ . , knnf, k=3)

library(rpart)
classifly(kyphosis, Kyphosis ~ . , rpart)

## No test: 
if (require("e1071")) {
classifly(kyphosis, Kyphosis ~ . , svm, probability=TRUE)
classifly(kyphosis, Kyphosis ~ . , svm, probability=TRUE, kernel="linear")
classifly(kyphosis, Kyphosis ~ . , best.svm, probability=TRUE,
   kernel="linear")

# Also can use explore directorly
bsvm <- best.svm(Species~., data = iris, gamma = 2^(-1:1),
  cost = 2^(2:+ 4), probability=TRUE)
explore(bsvm, iris)
}
## End(No test)



