library(randomizationInference)


### Name: zeroEffect
### Title: Potential Outcomes With Zero Treatment Effects
### Aliases: zeroEffect
### Keywords: methods

### ** Examples

## Assignments
w = c(0,0,0,0,0,1,1,1,1,1)
## Modified Assignments
w_new = c(1,1,1,1,1,0,0,0,0,0)
## Outcomes
y = c(4,6,5,7,4,7,11,9,8,12)
zeroEffect(y, w, w_new) ## Returns y as is



