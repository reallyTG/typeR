library(glm.predict)


### Name: polr.predict
### Title: predicted value for polr
### Aliases: polr.predict
### Keywords: models

### ** Examples

data = MASS::survey
data$Smoke = ordered(MASS::survey$Smoke,levels=c("Never","Occas","Regul","Heavy"))
model1 = MASS::polr(Smoke ~ Sex + Height, data=data, Hess=TRUE)
summary(model1)
# comparing a man to a woman
polr.predict(model1, c(1,170),sim.count=10000)



