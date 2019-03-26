library(robmixglm)


### Name: outlierProbs
### Title: Calculate outlier probabilities for each observation.
### Aliases: outlierProbs outlierProbs.robmixglm
### Keywords: method

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
outlierProbs(forbes.robustmix)



