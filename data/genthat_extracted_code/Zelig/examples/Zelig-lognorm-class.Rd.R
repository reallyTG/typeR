library(Zelig)


### Name: Zelig-lognorm-class
### Title: Log-Normal Regression for Duration Dependent Variables
### Aliases: Zelig-lognorm-class zlognorm

### ** Examples

library(Zelig)
data(coalition)
z.out <- zelig(Surv(duration, ciep12) ~ fract + numst2, model ="lognorm",  data = coalition)
summary(z.out)




