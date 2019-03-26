library(Zelig)


### Name: Zelig-gamma-survey-class
### Title: Gamma Regression with Survey Weights
### Aliases: Zelig-gamma-survey-class zgammasurvey

### ** Examples

library(Zelig)
data(api, package="survey")
z.out1 <- zelig(api00 ~ meals + yr.rnd, model = "gamma.survey",
weights = ~pw, data = apistrat)
summary(z.out1)




