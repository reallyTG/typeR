library(BaPreStoPro)


### Name: class.to.list
### Title: Builds a list from class object
### Aliases: class.to.list

### ** Examples

model <- set.to.class("jumpDiffusion",
             parameter = list(theta = 0.1, phi = 0.01, gamma2 = 0.1, xi = 3))
summary(class.to.list(model))



