library(randomizationInference)


### Name: constEffect
### Title: Potential Outcomes With Constant Treatment Effects
### Aliases: constEffect
### Keywords: methods

### ** Examples

## 1 treatment factor with 2 levels
## Assignments
w = c(0,0,0,0,0,1,1,1,1,1)
## Modified Assignments
w_new = c(1,1,1,1,1,0,0,0,0,0)
## Outcomes
y = c(4,6,5,7,4,7,11,9,8,12)
constEffect(y, w, w_new, poOptions = list(tau = 2))

## 2 treatment factors, each with 2 levels
## Assignments
w1 = c(0,0,0,0,0,1,1,1,1,1)
w2 = c(0,1,0,1,0,1,0,1,0,1)
w = cbind(w1,w2)
## Modified assignments
w1_new = c(1,1,1,1,1,0,0,0,0,0)
w2_new = c(1,0,1,0,1,0,1,0,1,0)
w_new = cbind(w1_new,w2_new)
## Outcomes
y = c(4,6,5,7,4,7,11,9,8,12)
constEffect(y, w, w_new, poOptions = list(tau = c(2,-1)))



