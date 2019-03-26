library(robmixglm)


### Name: plot.outlierProbs
### Title: Plot outlier probabilities.
### Aliases: plot.outlierProbs
### Keywords: method

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
plot(outlierProbs(forbes.robustmix))



