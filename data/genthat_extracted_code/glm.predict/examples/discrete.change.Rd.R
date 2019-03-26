library(glm.predict)


### Name: discrete.change
### Title: predicted values and discrete change
### Aliases: discrete.change
### Keywords: models

### ** Examples

model1 = glm(Sex ~ Height + Smoke + Pulse, data=MASS::survey, family=binomial(link=logit))
summary(model1)
# comparing a person with the height 150cm to 151cm
discrete.change(model1, c(1,150,1,0,0,mean(MASS::survey$Pulse,na.rm=TRUE)),
  c(1,151,1,0,0,mean(MASS::survey$Pulse,na.rm=TRUE)))
# the higher person has a greater probability to be a man
# the difference is significant, because the confidence interval
# does not include the 0



