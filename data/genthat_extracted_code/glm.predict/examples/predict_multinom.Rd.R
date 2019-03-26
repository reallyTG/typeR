library(glm.predict)


### Name: multinom.predict
### Title: predicted value for multinom
### Aliases: multinom.predict
### Keywords: models

### ** Examples

data = MASS::survey
data$Clap = relevel(data$Clap,ref="Neither")
model1 = nnet::multinom(Clap ~ Sex + Height, data=data)
summary(model1)
# comparing a man to a woman
multinom.predict(model1, c(1,1,170),sim.count=10000)



