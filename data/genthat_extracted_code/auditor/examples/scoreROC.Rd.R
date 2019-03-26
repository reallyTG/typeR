library(auditor)


### Name: scoreROC
### Title: Area Under ROC Curve (AUC)
### Aliases: scoreROC

### ** Examples

library(mlbench)
data("PimaIndiansDiabetes")
Pima <- PimaIndiansDiabetes
Pima$diabetes <- ifelse(Pima$diabetes == "pos", 1, 0)
glm_model <- glm(diabetes~., family=binomial,	data=Pima)
glm_au <- audit(glm_model, data = Pima, y = Pima$diabetes)
scoreROC(glm_au)




