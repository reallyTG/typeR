library(glm.predict)


### Name: nominal_discrete.changes
### Title: predicted values and discrete changes for multinom models
### Aliases: nominal_discrete.changes
### Keywords: models

### ** Examples

data = MASS::survey
data$Clap = relevel(data$Clap,ref="Neither")
model1 = nnet::multinom(Clap ~ Sex + Height, data=data)
summary(model1)
# comparing a woman to a man
# with the values 160, 170, 180 and 190 for the height
nominal_discrete.changes(model1, "0-1;160-190,10", data)



