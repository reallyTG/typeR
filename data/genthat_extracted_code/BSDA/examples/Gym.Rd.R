library(BSDA)


### Name: Gym
### Title: Children's age versus number of completed gymnastic activities
### Aliases: Gym
### Keywords: datasets

### ** Examples


plot(number ~ age, data = Gym)
model <- lm(number ~ age, data = Gym)
abline(model, col = "red")
summary(model)




