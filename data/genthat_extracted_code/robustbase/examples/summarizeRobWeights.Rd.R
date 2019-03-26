library(robustbase)


### Name: summarizeRobWeights
### Title: Print a Nice "summary" of Robustness Weights
### Aliases: summarizeRobWeights
### Keywords: utilities

### ** Examples

w <- c(1,1,1,1,0,1,1,1,1,0,1,1,.9999,.99999, .5,.6,1e-12)
summarizeRobWeights(w) # two outside ~= {0,1}
summarizeRobWeights(w, eps1 = 5e-5)# now three outside {0,1}

## See the summary(<lmrob>) outputs



