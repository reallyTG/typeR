library(distrEx)


### Name: LMParameter
### Title: Generating function for LMParameter-class
### Aliases: LMParameter
### Keywords: models

### ** Examples

LMParameter(theta = c(1,1), intercept = 2, scale = 0.5)

## The function is currently defined as
function(theta = 0, intercept = 0, scale = 1){
    new("LMParameter", theta = theta, intercept = intercept, scale = 1)
}



