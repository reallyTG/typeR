library(ROCit)


### Name: ciROCemp
### Title: Confidence Interval of Empirical ROC Curve
### Aliases: ciROCemp

### ** Examples

set.seed(100)
score <- c(runif(20, 15, 35), runif(15, 25, 45))
class <- c(rep(1, 20), rep(0, 15))
rocit_object <- rocit(score, class)
ciROC <- ciROCemp(rocit_object, level = 0.9)
names(ciROC)



