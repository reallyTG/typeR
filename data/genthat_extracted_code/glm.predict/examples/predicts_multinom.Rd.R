library(glm.predict)


### Name: multinom.predicts
### Title: predicted values for multinom models
### Aliases: multinom.predicts
### Keywords: models

### ** Examples

data = MASS::survey
data$Clap = relevel(data$Clap,ref="Neither")
model1 = nnet::multinom(Clap ~ Sex + Height, data=data)
summary(model1)
# comparing a woman to a man
# with the values 160, 170, 180 and 190 for the height
multinom.predicts(model1, "0-1;160-190,10", data)



