library(randomizationInference)


### Name: diffMeansVector
### Title: Vector of Pairwise Differences of Mean Outcomes
### Aliases: diffMeansVector
### Keywords: methods

### ** Examples

## 2 treatment factors, each with 3 levels
## Assignments, outcomes, and desired pairs
w1 = c(1,2,3,1,2,3,1,2,3)
w2 = c(1,2,3,2,3,1,3,1,2)
w = cbind(w1,w2)
y = c(4,6,5,7,4,7,11,9,10)
diffMeansVector(y, w, calcOptions = list(factors = c(1,1,2),
    pairs = rbind(c(1,2),c(2,3),c(1,3)))) ## Equals c(-1,1,0)



