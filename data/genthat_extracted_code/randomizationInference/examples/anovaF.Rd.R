library(randomizationInference)


### Name: anovaF
### Title: Analysis of Variance F statistic
### Aliases: anovaF
### Keywords: methods

### ** Examples

## 1 treatment factor with 3 levels
## Assignments and outcomes
w = c(1,1,1,1,2,2,2,2,3,3,3,3)
y = c(4,6,5,7,4,7,11,9,8,12,9,9)
anovaF(y, w)

## 1 treatment factor with 3 levels, with block
## Assignments, blocks, and outcomes
w = c(1,1,1,1,2,2,2,2,3,3,3,3)
x = c(1,1,2,2,1,1,2,2,1,1,2,2)
y = c(4,6,5,7,4,7,11,9,8,12,9,9)
anovaF(y, w, calcOptions = list(block = x))



