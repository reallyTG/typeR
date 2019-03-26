library(BaPreStoPro)


### Name: set.to.class
### Title: Building of model classes
### Aliases: set.to.class

### ** Examples

set.to.class("jumpDiffusion")
(names <- set.to.class("jumpDiffusion"))
model <- set.to.class("jumpDiffusion",
             parameter = list(theta = 0.1, phi = 0.01, gamma2 = 0.1, xi = 3))
summary(class.to.list(model))



