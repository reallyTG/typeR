library(glm.predict)


### Name: predicts
### Title: predicted values and discrete change
### Aliases: predicts
### Keywords: models

### ** Examples

model1 = glm(Sex ~ Height + Smoke + Pulse, data=MASS::survey, family=binomial(link=logit))
summary(model1)
# comparing person with hight 150 to 160, 160 to 170, 170 to 180, 180 to 190 
# with all combination of(non-)smokers and a median of pulse 
predicts(model1, "150-190,10;F;median", position = 1, doPar = FALSE)



