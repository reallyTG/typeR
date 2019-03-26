library(caret)


### Name: icr.formula
### Title: Independent Component Regression
### Aliases: icr.formula icr.default icr predict.icr
### Keywords: multivariate

### ** Examples


data(BloodBrain)

icrFit <- icr(bbbDescr, logBBB, n.comp = 5)

icrFit

predict(icrFit, bbbDescr[1:5,])



