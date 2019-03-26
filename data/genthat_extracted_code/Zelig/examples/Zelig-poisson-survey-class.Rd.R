library(Zelig)


### Name: Zelig-poisson-survey-class
### Title: Poisson Regression with Survey Weights
### Aliases: Zelig-poisson-survey-class zpoissonsurvey

### ** Examples

library(Zelig)
data(api, package="survey")
z.out1 <- zelig(enroll ~ api99 + yr.rnd , model = "poisson.survey", data = apistrat)
summary(z.out1)




