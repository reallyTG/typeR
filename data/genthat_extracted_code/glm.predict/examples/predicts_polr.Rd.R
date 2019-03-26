library(glm.predict)


### Name: polr.predicts
### Title: predicted values for polr models
### Aliases: polr.predicts
### Keywords: models

### ** Examples

data = MASS::survey
data$Smoke = ordered(MASS::survey$Smoke,levels=c("Never","Occas","Regul","Heavy"))
model1 = MASS::polr(Smoke ~ Sex + Height, data=data, Hess=TRUE)
summary(model1)
# comparing a woman to a man
# with the values 160, 170, 180 and 190 for the height
polr.predicts(model1, "0-1;160-190,10")



