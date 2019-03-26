library(Zelig)


### Name: Zelig-normal-survey-class
### Title: Normal Regression for Continuous Dependent Variables with Survey
###   Weights
### Aliases: Zelig-normal-survey-class znormalsurvey

### ** Examples

library(Zelig)
data(api, package = "survey")
z.out1 <- zelig(api00 ~ meals + yr.rnd, model = "normal.survey",eights = ~pw, data = apistrat)
summary(z.out1)




