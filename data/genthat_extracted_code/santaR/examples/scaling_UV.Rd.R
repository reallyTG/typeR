library(santaR)


### Name: scaling_UV
### Title: Unit-Variance scaling of each column
### Aliases: scaling_UV

### ** Examples

## No test: 
inputMat <- data.frame(matrix(c(1,4,7, 8,4,0, 3,6,9), nrow=3))
scaling_UV(inputMat)
#       X1 X2 X3
# [1,] -1  1 -1
# [2,]  0  0  0
# [3,]  1 -1  1
## End(No test)



