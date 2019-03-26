library(glm.predict)


### Name: ordinal_discrete.change
### Title: predicted values and discrete change for polr
### Aliases: ordinal_discrete.change
### Keywords: models

### ** Examples

data = MASS::survey
data$Smoke = ordered(MASS::survey$Smoke,levels=c("Never","Occas","Regul","Heavy"))
model1 = MASS::polr(Smoke ~ Sex + Height, data=data, Hess=TRUE)
summary(model1)
# comparing a man to a woman
ordinal_discrete.change(model1, c(1,170),
  c(0,170),sim.count=10000)



