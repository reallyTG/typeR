library(ROCit)


### Name: print.measureit
### Title: Print "measureit" Object
### Aliases: print.measureit

### ** Examples

data("Diabetes")
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
class <- logistic.model$y
score <- logistic.model$fitted.values
# -------------------------------------------------------------
measure <- measureit(score = score, class = class,
                     measure = c("ACC", "SENS", "FSCR"))
print(measure, n = 5)
print(measure, n = 10)







