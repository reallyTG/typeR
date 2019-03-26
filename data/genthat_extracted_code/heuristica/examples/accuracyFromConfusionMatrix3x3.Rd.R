library(heuristica)


### Name: accuracyFromConfusionMatrix3x3
### Title: Accuracy based on a predictPair confusion matrix.
### Aliases: accuracyFromConfusionMatrix3x3

### ** Examples

# Below accuracy is 1 (100% correct) because 4 -1's were correctly predicted,
# and 2 1's were correctly predicted.  (On-diagonal elements are correct
# predictions.)
accuracyFromConfusionMatrix3x3(cbind(c(4,0,0), c(0,0,0), c(0,0,2)))

# 3 wrong and 3 more wrong for 0 accuracy.
accuracyFromConfusionMatrix3x3(cbind(c(0,0,3), c(0,0,0), c(3,0,0)))

# Below is 4 + 5 correct, 1 incorrect, for 9/10 = 0.9 accuracy.
accuracyFromConfusionMatrix3x3(cbind(c(4,0,1), c(0,0,0), c(0,0,5)))

# Below has 3+1=4 guesses, and 0.5 are assigned correct.
accuracyFromConfusionMatrix3x3(cbind(c(0,0,0), c(3,0,1), c(0,0,0)))



