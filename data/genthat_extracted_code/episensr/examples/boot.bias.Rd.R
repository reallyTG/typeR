library(episensr)


### Name: boot.bias
### Title: Bootstrap resampling for selection and misclassification bias
###   models.
### Aliases: boot.bias

### ** Examples

misclass_eval <- misclassification(matrix(c(215, 1449, 668, 4296),
dimnames = list(c("Breast cancer+", "Breast cancer-"),
c("Smoker+", "Smoker-")),
nrow = 2, byrow = TRUE),
type = "exposure",
bias_parms = c(.78, .78, .99, .99))

set.seed(123)
boot.bias(misclass_eval)



