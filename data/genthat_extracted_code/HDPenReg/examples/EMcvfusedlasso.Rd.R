library(HDPenReg)


### Name: EMcvfusedlasso
### Title: cross validation for EM fused-lasso
### Aliases: EMcvfusedlasso

### ** Examples

dataset <- simul(50, 100, 0.4, 1, 10, matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result <- EMcvfusedlasso(X = dataset$data, y = dataset$response, lambda1 = 3:1, 
                         lambda2 = 3:1, nbFolds = 5,intercept = FALSE)



