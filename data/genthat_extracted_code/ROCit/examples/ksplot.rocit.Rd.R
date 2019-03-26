library(ROCit)


### Name: ksplot.rocit
### Title: KS Plot
### Aliases: ksplot.rocit

### ** Examples

data("Diabetes")
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
class <- logistic.model$y
score <- logit(logistic.model$fitted.values)
# -------------------------------------------------------------
roc_emp <- rocit(score = score, class = class) # default method empirical
# -------------------------------------------------------------
kplot1 <- ksplot(roc_emp)
message("KS Stat (empirical) : ", kplot1$`KS stat`)
message("KS Stat (empirical) cutoff : ", kplot1$`KS Cutoff`)





