library(ROCit)


### Name: measureit.rocit
### Title: Performance Metrics of Binary Classifier
### Aliases: measureit.rocit

### ** Examples

data("Diabetes")
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
class <- logistic.model$y
score <- logistic.model$fitted.values
rocit_object <- rocit(score = score, class = class)
# -------------------------------------------------------------
measure <- measureit(rocit_object, measure = c("ACC", "SENS", "FSCR"))
names(measure)
plot(measure$ACC~measure$Cutoff, type = "l")
plot(measure$TP~measure$FP, type = "l")




