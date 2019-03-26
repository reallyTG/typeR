library(ROCit)


### Name: ciAUC.rocit
### Title: Confidence Interval of AUC
### Aliases: ciAUC.rocit

### ** Examples

data("Diabetes")
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
score <- logistic.model$fitted.values
class <- logistic.model$y
# Make the rocit objects
rocit_bin <- rocit(score = score, class = class, method = "bin")
# Confidence interval of AUC
ciAUC(rocit_bin, level = 0.9)
ciAUC(rocit_bin, delong = TRUE, logit = TRUE)




