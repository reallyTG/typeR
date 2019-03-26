library(epiDisplay)


### Name: print lrtest
### Title: Print lrtest results
### Aliases: print.lrtest
### Keywords: database

### ** Examples

model0 <- glm(case ~ induced + spontaneous, family=binomial, data=infert)
model1 <- glm(case ~ induced, family=binomial, data=infert)
lrtest (model0, model1)
lrtest (model1, model0) -> a
a


