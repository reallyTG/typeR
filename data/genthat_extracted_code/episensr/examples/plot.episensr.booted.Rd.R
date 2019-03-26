library(episensr)


### Name: plot.episensr.booted
### Title: Plot of bootstrap simulation output for selection and
###   misclassification bias
### Aliases: plot.episensr.booted

### ** Examples

misclass_eval <- misclassification(matrix(c(215, 1449, 668, 4296),
dimnames = list(c("Breast cancer+", "Breast cancer-"),
c("Smoker+", "Smoker-")),
nrow = 2, byrow = TRUE),
type = "exposure",
bias_parms = c(.78, .78, .99, .99))

set.seed(123)
misclass_boot <- boot.bias(misclass_eval)
plot(misclass_boot, association = "rr")




