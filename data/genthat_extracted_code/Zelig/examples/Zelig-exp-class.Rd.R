library(Zelig)


### Name: Zelig-exp-class
### Title: Exponential Regression for Duration Dependent Variables
### Aliases: Zelig-exp-class zexp

### ** Examples

library(Zelig)
data(coalition)
library(survival)
z.out <- zelig(Surv(duration, ciep12) ~ fract + numst2, model = "exp",
               data = coalition)
summary(z.out)




