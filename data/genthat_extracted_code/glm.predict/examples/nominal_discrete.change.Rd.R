library(glm.predict)


### Name: nominal_discrete.change
### Title: predicted values and discrete change for multinom
### Aliases: nominal_discrete.change
### Keywords: models

### ** Examples

data = MASS::survey
data$Clap = relevel(data$Clap,ref="Neither")
model1 = nnet::multinom(Clap ~ Sex + Height, data=data)
summary(model1)
# comparing a man to a woman
nominal_discrete.change(model1, c(1,1,170),
  c(1,0,170),sim.count=10000)



