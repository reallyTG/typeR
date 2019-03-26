library(crossval)


### Name: confusionMatrix
### Title: Compute Confusion Matrix
### Aliases: confusionMatrix
### Keywords: univar

### ** Examples

# load crossval library
library("crossval")

# true labels
a = c("cancer", "cancer", "control", "control", "cancer", "control", "control")

# predicted labels
p = c("cancer", "control", "control", "control", "cancer", "control", "cancer")

# confusion matrix (a vector)
cm = confusionMatrix(a, p, negative="control") 
cm
# FP TP TN FN 
# 1  2  3  1 
# attr(,"negative")
# [1] "control"

# corresponding accuracy, sensitivity etc.
diagnosticErrors(cm)
#       acc      sens      spec       ppv       npv       lor 
# 0.7142857 0.6666667 0.7500000 0.6666667 0.7500000 1.7917595
# attr(,"negative")
# [1] "control"



