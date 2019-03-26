library(isdals)


### Name: alligator
### Title: Alligator food preference
### Aliases: alligator
### Keywords: datasets

### ** Examples

data(alligator)
library(VGAM)
model <- vglm(food ~ length, family=multinomial, data=alligator)
summary(model)



