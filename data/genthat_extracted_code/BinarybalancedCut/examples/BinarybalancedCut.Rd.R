library(BinarybalancedCut)


### Name: Binary_threshold
### Title: This Supports the datascientist to determine the optimal
###   threshold for binary classifier problem by visuallizing the
###   sensitivity, specificity and accurarcy of the given model
### Aliases: Binary_threshold

### ** Examples

set.seed(100);disease <- sample(c("yes","no"), 1000, replace=TRUE);
Probabilities<-sample(seq(0,1,by=0.01),1000,replace=TRUE);
Binary_threshold(Probabilities,disease)


