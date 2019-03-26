library(UsingR)


### Name: healthy
### Title: Healthy or not?
### Aliases: healthy
### Keywords: datasets

### ** Examples

data(healthy)
library(MASS)
stepAIC(glm(healthy ~ p + g, healthy, family=binomial))



