library(Zelig)


### Name: Zelig-gamma-class
### Title: Gamma Regression for Continuous, Positive Dependent Variables
### Aliases: Zelig-gamma-class zgamma

### ** Examples

library(Zelig)
data(coalition)
z.out <- zelig(duration ~ fract + numst2, model = "gamma", data = coalition)
summary(z.out)




