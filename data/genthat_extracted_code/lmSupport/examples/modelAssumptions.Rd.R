library(lmSupport)


### Name: modelAssumptions
### Title: Assess Linear Model Assumptions
### Aliases: modelAssumptions
### Keywords: regression

### ** Examples

data(BAC)
m = lm(FPS~BAC+TA, data=BAC)
modelAssumptions(m,'NORMAL')
modelAssumptions(m,'CONSTANT')
modelAssumptions(m,'LINEAR', ID=NULL)



