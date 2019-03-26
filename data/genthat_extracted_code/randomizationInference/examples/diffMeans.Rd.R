library(randomizationInference)


### Name: diffMeans
### Title: Single Pairwise Difference of Mean Outcomes
### Aliases: diffMeans
### Keywords: methods

### ** Examples

## 1 treatment factor with 2 levels
## Assignments and outcomes
w = c(0,0,0,0,0,1,1,1,1,1)
y = c(4,6,5,6,4,11,11,9,10,9)
diffMeans(y, w) ## Equals 5

## 2 treatment factors, each with 3 levels
## Assignments and outcomes
w1 = c(1,2,3,1,2,3,1,2,3)
w2 = c(1,2,3,2,3,1,3,1,2)
w = cbind(w1,w2)
y = c(4,6,5,7,4,7,11,9,10)
diffMeans(y, w,
    calcOptions = list(factor = 2, pair = c(1,3))) ## Equals 0



