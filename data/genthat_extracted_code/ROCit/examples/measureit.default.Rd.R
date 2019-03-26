library(ROCit)


### Name: measureit.default
### Title: Performance Metrics of Binary Classifier
### Aliases: measureit.default

### ** Examples

data("Diabetes")
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
class <- logistic.model$y
score <- logistic.model$fitted.values
# -------------------------------------------------------------
measure <- measureit(score = score, class = class,
                     measure = c("ACC", "SENS", "FSCR"))
names(measure)
plot(measure$ACC~measure$Cutoff, type = "l")
plot(measure$TP~measure$FP, type = "l")




