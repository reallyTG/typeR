library(glm.predict)


### Name: basepredict
### Title: predicted value
### Aliases: basepredict
### Keywords: models

### ** Examples

model1 = glm(Sex ~ Height + Smoke + Pulse, data=MASS::survey, family=binomial(link=logit))
summary(model1)
# comparing a person with the height 150cm to 151cm
basepredict(model1, c(1,150,1,0,0,mean(MASS::survey$Pulse,na.rm=TRUE)))



