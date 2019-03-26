library(stablelearner)


### Name: accuracy
### Title: Prediction Accuracy from Stability Assessment Results
### Aliases: accuracy
### Keywords: resampling, similarity

### ** Examples


## No test: 
library("partykit")
res <- ctree(Species ~ ., data = iris)
stab <- stability(res)
accuracy(stab)
## End(No test)




