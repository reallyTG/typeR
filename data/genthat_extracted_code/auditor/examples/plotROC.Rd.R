library(auditor)


### Name: plotROC
### Title: Receiver Operating Characteristic (ROC)
### Aliases: plotROC

### ** Examples

library(mlbench)
data("PimaIndiansDiabetes")
Pima <- PimaIndiansDiabetes
Pima$diabetes <- ifelse(Pima$diabetes == "pos", 1, 0)
glm_model <- glm(diabetes~., family=binomial,	data=Pima)
glm_au <- audit(glm_model, data = Pima, y = Pima$diabetes)
plotROC(glm_au)




