library(ROCit)


### Name: print.rocitaucci
### Title: Print Confidence Interval of AUC
### Aliases: print.rocitaucci

### ** Examples

data("Diabetes")
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
score <- logistic.model$fitted.values
class <- logistic.model$y
# Make the rocit objects
rocit_bin <- rocit(score = score, class = class, method = "bin")
obj_1 <- ciAUC(rocit_bin, level = 0.9)
obj_2 <- ciAUC(rocit_bin, delong = TRUE)
obj_3 <- ciAUC(rocit_bin, delong = TRUE, logit = TRUE)
# Print
print(obj_1)
print(obj_2)
print(obj_3)



