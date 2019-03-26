library(santaR)


### Name: scaling_mean
### Title: Mean scaling of each column
### Aliases: scaling_mean

### ** Examples

## No test: 
inputMat <- data.frame(matrix(c(1,4,7, 8,4,0, 3,6,9), nrow=3))
scaling_mean(inputMat)
#          X1 X2  X3
# [1,] -0.75  1 -0.5
# [2,]  0.00  0  0.0
# [3,]  0.75 -1  0.5
## End(No test)



