library(cvTools)


### Name: cvReshape
### Title: Reshape cross-validation results
### Aliases: cvReshape cvReshape.cv cvReshape.cvSelect
### Keywords: utilities

### ** Examples

library("robustbase")
data("coleman")

# perform cross-validation for an LTS regression model
fitLts <- ltsReg(Y ~ ., data = coleman)
cvFitLts <- cvLts(fitLts, cost = rtmspe, K = 5, R = 10, 
    fit = "both", trim = 0.1, seed = 1234)
# compare original and reshaped object
cvFitLts
cvReshape(cvFitLts)



