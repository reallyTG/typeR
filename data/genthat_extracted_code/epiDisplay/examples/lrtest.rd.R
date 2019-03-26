library(epiDisplay)


### Name: lrtest
### Title: Likelihood ratio test
### Aliases: lrtest
### Keywords: htest

### ** Examples

model0 <- glm(case ~ induced + spontaneous, family=binomial, data=infert)
model1 <- glm(case ~ induced, family=binomial, data=infert)
lrtest (model0, model1)
lrtest (model1, model0) # same result
lrtest (model1, model0) -> a
a



